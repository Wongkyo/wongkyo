/**
 * 
 */
$("#contents").summernote({
			height:300,
			placeholder: '작성하세요',
			callbacks: {
				onImageUpload: function(files) {
				   uploadFile(files);				   
				 },
				onMediaDelete: function(files){
					deleteFile(files);
				}					
			}
});

function uploadFile(files) {
	const formData = new FormData();//Form 태그 생성
	formData.append('file', files[0]); //input type="file" name="file"
	let fileName="";
	$.ajax({
		type: "POST",
		url: "./summerFileUpload",
		data:formData,
		enctype:"multipart/form-data",
		cache:false,
		processData:false,
		contentType:false,
		success:function(result){
			fileName=result.trim();
			$("#contents").summernote('insertImage', fileName);
		} 
		
	});		
}

function deleteFile(files){
	let fileName = $(files[0]).attr("src");
	fileName = fileName.substring(fileName.lastIndexOf('/')+1);
	$.post("summerFileDelete", {fileName:fileName}, function(result){
		console.log(result);
	});
}


