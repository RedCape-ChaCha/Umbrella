<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Tables</title>

  <!-- Custom fonts for this template -->
  <link href="./resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="./resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="./css/yslib/sub.css">
</head>

<body id="page-top">
<script src="./resources/vendor/jquery/jquery.min.js"></script>
<script src="./ckeditor/ckeditor.js"></script>

<script type="text/javascript">
	$(function(){
	
	CKEDITOR.replace('ckeditor',{
		width : "100%",
		height: "300px",
		filebrowserUploadUrl : "./imgUpload.do"
	});
	
	$("#listBtn").click(function() {
		location.href="./noList.do";
	});

	});
	
	
</script>
 <jsp:include page="/WEB-INF/views/adminHeader.jsp"></jsp:include>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">공지사항</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
            	<h6 class="m-0 font-weight-bold text-primary">공지사항 작성</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
               <form action="./admin.noInsert.do" method="post" enctype="multipart/form-data">
						<div class="boardWrap">
							<table class="board-view">
								<caption>공지사항</caption>
								<colgroup>
									<col style="width:15%">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="title">제목</label></th>
										<td><input type="text" id="title" name="board_title" class="form-ele full" required="required"></td>
									</tr>
									<tr>
										<th scope="row">작성자</th>
										<td>관리자</td>
									</tr>
									<tr>
										<td colspan="2" class="textarea">
											<textarea name="board_content" title="질문 내용 입력" id="ckeditor" required="required"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					<div class="btnGroup">
						<input type="button" id="listBtn" class="btn cncl" value="취소">
						<input type="submit" id="registBtn" class="btn themeBtn" value="등록">
					</div>
					</form>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
	
      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="./resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="./resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="./resources/js/demo/datatables-demo.js"></script>
  <!-- ckeditor JavaScript  -->

</body>

</html>