<%@page import="com.rainbow.um.dto.UserDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>스마트도서관 - 회원관리</title>

  <!-- Custom fonts for this template -->
  <link href="./resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="./resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>

<body id="page-top">

 <jsp:include page="/WEB-INF/views/adminHeader.jsp"></jsp:include>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">전체회원조회</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">회원 관리 페이지 입니다.</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive" >
               <script type="text/javascript">
               window.onload=function(){
            	   var btns = document.getElementsByTagName("button");
            	   var nGrade = document.getElementsByTagName("nGrade");
	       			for (var i = 0; i < btns.length; i++) {
	       				btns[i].onclick = function(){
	       					var id= this.value;
	       					var grade = this.parentNode.childNodes[1].options[this.parentNode.childNodes[1].selectedIndex].value;
							authAjax(id,grade);
	       				}
	       			}
               }
               
               var authAjax= function(id, grade){
            	   $.ajax({
            		type : "post",
            		url : "./admin.authChange.do",
            		data : "user_email="+id+"&user_grade="+grade,
            		async : true,
            		success : function(){
            			if(grade == "U"){
            				grade = "A";
            			}else{
							grade = "U";           				
            			}
            		},
            		error : function(){
            			alert("수정 안되었음");	
            		}
            		
            	   });
               }
                </script>
	                <table class="table table-bordered" id="dataTable"  cellspacing="0" >
	                  <thead>
	                    <tr>
	                      <th>회원번호</th>
	                      <th>이메일</th>
	                      <th>전화번호</th>
	                      <th>우편번호</th>
	                      <th>주소</th>
	                      <th>상세주소</th>
	                      <th>가입일</th>
	                      <th>마일리지</th>
	                      <th>회원등급</th>
	                    </tr>
	                  </thead>
	                  <tbody>
	 						<c:forEach items="${lists}" var="user">
	 							<tr>
									<td>${user.user_number  }</td>
									<td>${user.user_email   }</td>
									<td>${user.user_phone   }</td>
									<td>${user.user_zip     }</td>
									<td>${user.user_address }</td>
									<td>${user.user_detail  }</td>
									<td>${user.user_regdate }</td>
									<td>${user.user_mileage }</td>
									<td>
<%-- 										${user.user_grade } --%>
										<select name="nGrade">
											<option value="U" <c:if test="${user.user_grade eq 'U'}" >selected</c:if>>U</option>										
											<option value="A" <c:if test="${user.user_grade eq 'A'}"> selected</c:if>>A</option>										
										</select>
										<button id="varAuth" value="${user.user_email}">변경</button>
									</td>
	 							</tr>
	 						</c:forEach>
	                  </tbody>
	                </table>
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
  <script src="./resources/vendor/jquery/jquery.min.js"></script>
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

</body>

</html>