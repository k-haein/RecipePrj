
$(document).ready(function() {
    bindEvent(document.getElementById("q_main_file"), 'change', handlePhotoFiles);
	bindEvent(document.getElementById("q_video_file"), 'change', handlePhotoFiles);
    for (var i=1; i<=4; i++) {
        bindEvent(document.getElementById("q_work_file_"+i), 'change', handlePhotoFiles);
    }
    bindEvent(document.getElementById("multifile_1"), 'change', handleMultiPhoto);
	bindEvent(document.getElementById("multifile_2"), 'change', handleMultiPhoto);
    addMaterialGroup('재료',[]);addStep();

	$('#divAutoMaterialModal').on('show.bs.modal',function(e) {
		var idx = $(e.relatedTarget).data('group_idx');
		var title = $("#material_group_title_"+idx).val();
		if ($.trim(title) == '') {
			title = '재료/양념';
		}
		$("#auto_material_title").attr('group_idx',idx);
		$("#auto_material_title").html('['+title+'] 한번에 넣기');
    });
	$("#btnAutoMaterialConfirm").click(function() {
		var idx = $("#auto_material_title").attr('group_idx');
		var str = $.trim($("#q_auto_material").val());
		if (str == '') {
			alert("내용을 입력하세요.");
			$("#q_auto_material").focus();
		} else {
			if (idx != '') {
                setAutoMaterial(idx,str);
            }
		}
	});

        	//동영상 사진 관련 /////////////////////////////////////
    $("#cok_video_url").blur(function() {
        if ($(this).val() != '' && $(this).val() != $(this).attr('prev_url')) {
            if ($(this).val().indexOf('http://') > -1 || $(this).val().indexOf('https://') > -1) {
                getVideoThumb($.trim($(this).val()));
            } else {
                delVideoPhoto();
            }
        } else if ($.trim($(this).val()) == '' || ($(this).val().indexOf('http://') < 0 && $(this).val().indexOf('https://') < 0)) {
            delVideoPhoto();
        }
    });
    $('#viewVideoDivModal').on('hidden.bs.modal', function () {
        $('#viewVideoModalCont').html('');
    });

    $(".btn-lineup").tooltip({
        'placement': 'top',
        'container': $('.recipe_regi'),
        'title': '드래그하면 순서를 변경할 수 있습니다.'
    });

	$("#divWorkArea").sortable({
        cursor: 'move',
        handle: $('.complete_pic'),
        helper: function(e, ui){
			/* 드래그 시, tr의 width 보존 */
            ui.children().each(function() {
                $(this).width($(this).width());
				$(this).height($(this).height());
            });
            return ui;
        },
		start: function(e, ui){
	    },
        stop: function(e,ui) {
        }
    }).disableSelection();
});
var isSubmit = false;
function doSubmit(q_mode)
{
	if (isGettingThumb) {
        alert("동영상 썸네일을 가져오는 중입니다. 잠시만 기다리세요.");
        return;
    }
    $("#q_mode").val(q_mode);

    chkResult = validateRecipeForm(q_mode);
    if (!chkResult) {
        return isSubmit = false;
    }
    if (q_mode == 'save') {
        if (confirm("저장하시겠습니까?")) {
            isSubmit = true;
            $("#insFrm").submit();
        }
        else {
            isSubmit = false;
        }
    } else if (q_mode == 'save_preview') {
        if (confirm("미리보기를 하려면 저장하셔야 합니다. 저장하시겠습니까?")) {
            isSubmit = true;
            $("#insFrm").submit();
        }
        else {
            isSubmit = false;
        }
    } else if (q_mode == 'save_public') {
				var msg = '레시피 공개 후, 리스트 및 검색에 노출되는 데는 하루 정도의 시간이 소요됩니다.\n\n레시피를 공개하시겠습니까?';
		        if (confirm(msg)) {
            isSubmit = true;
            $("#insFrm").submit();
        }
        else {
            isSubmit = false;
        }
    } else if (q_mode == 'save_work' || q_mode == 'save_confirm') {
        isSubmit = true;
        $("#insFrm").submit();
    } else {
        isSubmit = false;
    }
}
function validateRecipeForm(q_mode) {
    if ($.trim($("#cok_title").val()) == '') {
        alert('레시피 제목을 입력해 주세요.');
        $("#cok_title").focus();
        return isSubmit = false;
    }

    if (q_mode != 'save') {
        if ($("#main_photo").val() == '') {
            alert('대표사진을 선택해 주세요.');
            return isSubmit = false;
        }
        if ($.trim($("#cok_intro").val()) == '') {
            alert('요리소개 내용을 입력해 주세요.');
            $("#cok_intro").focus();
            return isSubmit = false;
        }
        if ($("#cok_sq_category_1").val() == '') {
            alert('방법별 카테고리를 선택해 주세요.');
            $("#cok_sq_category_1").focus();
            return isSubmit = false;
        }
        if ($("#cok_sq_category_2").val() == '') {
            alert('상황별 카테고리를 선택해 주세요.');
            $("#cok_sq_category_2").focus();
            return isSubmit = false;
        }
        if ($("#cok_sq_category_3").val() == '') {
            alert('재료별 카테고리를 선택해 주세요.');
            $("#cok_sq_category_3").focus();
            return isSubmit = false;
        }
        if ($("#cok_sq_category_4").val() == '') {
            alert('종류별 카테고리를 선택해 주세요.');
            $("#cok_sq_category_4").focus();
            $("#btnAllCategory").trigger('click');

            return isSubmit = false;
        }
		if ($("#is_tv_recipe").prop('checked')) {

		} else {
			if ($("#cok_portion").val() == '') {
                alert('요리인원 선택해 주세요.');
                $("#cok_portion").focus();
                return isSubmit = false;
            }
			if ($("#cok_time").val() == '') {
                alert('요리시간을 선택해 주세요.');
                $("#cok_time").focus();
                return isSubmit = false;
            }
            if ($("#cok_degree").val() == '') {
                alert('난이도를 선택해 주세요.');
                $("#cok_degree").focus();
                return isSubmit = false;
            }
		}

        var resource_cnt = 0;
		$("#divResourceArea [id^=liResource_]").each(function(i) {
            var step = $(this).prop('id').replace('liResource_','');
            if ($.trim($("#cok_resource_nm_" + step).val()) != '') {
                resource_cnt++;
            }
        });
		var invalid_resource = false;
        $("[id^=cok_material_nm_]").each(function() {
			if ($.trim($(this).val()) != '') {
                resource_cnt++;
            }
			var idx = $(this).prop('id').replace('cok_material_nm_','');
			if ($(this).val().indexOf('[') > -1 || $(this).val().indexOf(']') > -1) {
				invalid_resource = true;
				$(this).focus();
				return false;
			}
			if ($("#cok_material_amt_"+idx).val().indexOf('[') > -1 || $("#cok_material_amt_"+idx).val().indexOf(']') > -1) {
				invalid_resource = true;
				$("#cok_material_amt_"+idx).focus();
                return false;
            }
		});
		if (invalid_resource) {
			alert('요리재료에 [ 또는 ] 문자를 입력할 수 없습니다.');
			return isSubmit = false;
		}
        if (resource_cnt < 1) {
            alert('요리재료는 최소 1개 이상이어야 합니다.');
			if ($("#divResourceArea [id^=liResource_]").length > 0) {
				$("#divResourceArea > li:last-child").find('input')[0].focus();
			} else {
				$("[id^=cok_material_nm_]:first").focus();
			}
            return isSubmit = false;
        }

        var step_cnt = 0;
        var invalid_step = 0;
        $("#divStepArea [id^=divStepItem_]").each(function(i) {
            var step = $(this).prop('id').replace('divStepItem_','');
            if ($("#step_photo_"+step).val() != '' && $.trim($("#step_text_" + step).val()) == '') {
                alert("내용을 입력하세요.");
                $("#step_text_" + step).focus();
                invalid_step = step;
                return false;
            } else if ($.trim($("#step_text_" + step).val()) != '') {
                step_cnt++;
            }
        });
        if (invalid_step > 0) {
            return isSubmit = false;
        }
        if (step_cnt < 3) {
            alert('요리순서는 최소 3개 이상이어야 합니다.');
            $("#divStepArea textarea").last().focus();
            return isSubmit = false;
        }

    }
    return true;
}
function doDelete() {
    if (confirm("레시피를 삭제하시겠습니까?")) {
        isSubmit = true;
        $("#insFrm [name=q_mode]").val('delete');
        $("#insFrm").submit();
    }
    else {
        isSubmit = false;
    }
}
function addRecipe(json) {

    if (json.length) {
        var idx = 0;
        $("[id^=trRecipeRow_]").each (function() {
            var num = parseInt($(this).prop('id').replace('trRecipeRow_',''),10);
            idx = Math.max(idx,num);
        });

        var str = '';
        for (var i=0; i<json.length; i++) {

            if ($("[name='recipe_no[]'][value='"+json[i]['recipe_no']+"']").length) {
                alert('['+$("<div>").text(json[i]['recipe_nm']).html()+']는 이미 추가된 레시피 입니다.');
                continue;
            }

            idx++;

            str += '<tr id="trRecipeRow_'+idx+'" class="sortable_row">';
            str += '<input type="hidden" name="rel_cok_sq_board[]" value="'+json[i]['recipe_no']+'">';
            var title_width = $("#tableRecipeList").width() - 60 - 80 - 100 - 80 - 5;
            //alert(title_width);
            if (json[i]['recipe_no']) {
                str += '<td class="ac sortable_col" style="height:39px;width:120px;"><div class="sortable_row_class">' + json[i]['recipe_no'] + '</div></td>';
            } else {
                str += '<td class="sortable_col" style="height:39px;width:120px;"></td>';
            }
            if (json[i]['str_reg_type']) {
                str += '<td class="ac" style="height:39px;width:120px;">' + json[i]['str_reg_type'] + '</td>';
            } else {
                str += '<td class="ac" style="height:39px;width:120px;"></td>';
            }
            if (json[i]['thumb'] != '') {
                str += '<td class="ac" style="width:60px"><img src="' + json[i]['thumb'] + '" style="width:32px;height:32px"></td>';
            } else {
                str += '<td style="width:60px"></td>';
            }
            if (json[i]['recipe_no']) {
                str += '<td class="al" style="width:'+title_width+'px;"><a href="javascript:EAD.showDialog({\'title\':\'레시피 정보\',\'url\':\'/admin/recipe/view_recipe.html?cok_sq_board='+json[i]['recipe_no']+'\',\'width\':1300,\'modal\':false,\'fullsize\':true});">' + json[i]['recipe_nm'] + '</a></td>';
            } else {
                str += '<td class="al" style="width:'+title_width+'px;">' + json[i]['recipe_nm'] + '</td>';
            }
            str += '<td style="width:80px"><a href="javascript:delRecipe('+idx+');" role="button" class="btn btn-xs btn-default">삭제</td>';
            str += '</tr>';
        }
        $("#trNoRecipe").hide();
        $(str).appendTo("#tbodyRecipeList");

        $("#tbodyRecipeList").sortable({
            cursor: 'move',
            handle: $('.sortable_col'),
            helper: function(e, ui){
                /* 드래그 시, tr의 width 보존 */
                ui.children().each(function() {
                    $(this).width($(this).width());
                });
                return ui;
            },
            stop: function(e,ui) {

            }
        }).disableSelection();

        $(".sortable_row_class").tooltip({
            'placement': 'top',
            'container': $('#tableRecipeList'),
            'title': '드래그하면 순서를 변경할 수 있습니다.'
        });

    }

}
function delRecipe(idx) {
    $("#trRecipeRow_"+idx).remove();
    if (!$("[id^=trRecipeRow_]").length) {
        $("#trNoRecipe").show();
    }
}
function handleMultiPhoto(evt) {
    var files = evt.target.files; // FileList object
    var max_step = 0;
	var file_gubun = $(evt.target).attr('file_gubun');
	var holder_cnt = 0;
	var json_holder = [];
	var json_occupy = [];

	$("#"+(file_gubun == 'step' ? 'divStepArea' : 'divWorkArea') + " [id^="+file_gubun+"_photo_]").each(function() {
		var temp_step = parseInt($(this).prop('id').replace(file_gubun+'_photo_',''),10);
        if ($(this).val() == '') {
			json_holder.push(temp_step);
        }
		max_step = Math.max(max_step,temp_step);
    });
	for (var i = json_holder.length; i < files.length; i++) {
       addStep();
	   max_step = max_step + 1;
	   json_holder.push(max_step);
	}

	for (var i = 0; i < files.length; i++) {
        var file = files[i];
        if (!file.type.match('image')) continue; //Only pics
        var reader = new FileReader();
		readerOnloadPhoto(reader,file,file_gubun,json_holder[i]);
		//step_num++;
    }
}

function readerOnloadPhoto(reader,file,file_gubun,step_num)
{
	if (file_gubun == 'step') {
        $('#divStepPhotoBox_' + step_num).html('<div class="text-center" style="margin:50px 0 0 0;width:160px"><span class="fa fa-spinner fa-spin fa-2x"></span></div>');
    } else if (file_gubun == 'work') {
        $('#divWorkPhotoBox_' + step_num).html('<div class="text-center" style="margin:50px 0 0 0"><span class="fa fa-spinner fa-spin fa-2x"></span></div>');
    }
    reader.onload = function (e) {

        var finalFile = e.target.result;
        var finalName = file.name;

        var img = new Image();
        img.src = reader.result;
        img.onload = function () {

            $.ajax({
				beforeSend: function(xhr){
                    xhr.setRequestHeader('Content-Type', 'canvas/upload');
                },
                type: "POST",
                url: "/common/upload_photo.html?file_gubun=" + file_gubun + "&id=" + step_num,
                data: "canvasData="+finalFile,
                dataType: "json",
                cache: "false",
				async: false,
                processData: false,
                success: function(json) {
                    if(json['result'] == "SUCCESS") {
						if (json['file_gubun'] == 'step') {
						    setStepPhoto('1', json['url'], '', json['id']);
						} else if (json['file_gubun'] == 'work') {
						    setWorkPhoto('1', json['url'], '', json['id']);
						}
                    } else {
                        alert("처리에 실패하였습니다.");
                    }
                },
                error: function (request,status,error) {
                    //alert('오류가 발생하였습니다.');
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
        }
    }
    reader.readAsDataURL(file);
}

$(function() {

    var cache = {};
    $("#mySingleFieldTags").tagit({
        singleField: true,
        singleFieldNode: $('#mySingleFieldTags'),
        singleFieldDelimiter: ',',
        allowSpaces: true,
        preprocessTag : function(val) {
            return val.replace(",","").replace("#","");
        },
        afterTagAdded : function(event, ui) {
            // limit length
            var tArr = $("#mySingleFieldTags").tagit("assignedTags");
            if(tArr.length > 10)
            {
                alert('태그는 10개까지만 작성이 가능합니다.');
                $("#mySingleFieldTags").tagit("removeTagByLabel", tArr[tArr.length - 1]);
            }
        },
        autocomplete : {
            //minLength : 2,
            source: function( request, response ) {
                var term = request.term;
                if ( term in cache ) {
                    response( cache[ term ] );
                    return;
                }
                $.getJSON( "/util/autocomplete.html?q_mode=tag", request, function( data, status, xhr ) {
                    cache[ term ] = data;
                    response( data );
                });
            }
        }
    });
});

