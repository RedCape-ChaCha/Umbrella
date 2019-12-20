<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>SB Admin 2 - Dashboard</title>
  <!-- Custom fonts for this template-->
  <link href="./resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  
  <link href="./resources/css/sb-admin-2.min.css" rel="stylesheet">
  <link type="text/css" rel="stylesheet"	href="./resources/css/bootstrap.css">
  <script type="text/javascript" src="./resources/js/bootstrap.js"></script>
<style type="text/css">
table>div {
	width: 100px;
}
</style>

</head>

<body id="page-top">

  <jsp:include page="/WEB-INF/views/adminHeader.jsp"></jsp:include>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Contents</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">신규 도서 대출 신청</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable"  cellspacing="0" style="text-align: center ; padding: auto;">
                  <thead>
                    <tr>
                      <th>신청자</th>
                      <th>신청 도서명</th>
                      <th>신청일</th>
                      <th>처리상태</th>
                      <th></th>
                      <th>입력사항</th>
                      <th>처리완료</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${lists1}" var="dto">
                  <c:if test="${dto.apply_check eq 'N'}">
                    <tr>
                      <td>${dto.user_email}</td>
                      <td>${dto.book_name}</td>
                      <td>${dto.apply_date}</td>
                      <td>
                      	신규신청
                      </td>
                      <td></td>
                      <td>
                      <a href="javascript:bookch(${dto.book_cseq})">
                      <div class="card bg-secondary text-white shadow">
                      	도서 배정
                  		</div>
                      </a>
                      <a href="javascript:savech()">
                      <div class="card bg-secondary text-white shadow">
                     	 보관함 배정
                  		</div>
                      </a>
                      </td>
                      <td>
                      		<form action="" >
							<input type="hidden" name="book_aseq" id="frmbseq${dto.book_cseq}" value="">                      
							<input type="hidden" name="locker_number" id="frmblockerNum${dto.book_cseq}" value="">                      
                        <div class="card bg-warning text-white shadow" ondblclick="bookNext()">
                     	 <p>
                     	 도서 대출
                     	 </p>
                  		</div>
                      		</form>
                      </td>
                    </tr>
                     </c:if>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
 <!-- Content Row -->
          <div class="row">

            <!-- Content Column -->

            <div class="col-lg-6 mb-4">

              <!-- Illustrations -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">웹 도서 대출 현황</h6>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>신청자</th>
                      <th>신청 도서명</th>
                      <th>도서번호</th>
                      <th>신청일</th>
                      <th>조치일</th>
                      <th>보관함</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${lists2}" var="dto">
                    <tr>
                      <td>${dto.user_email}</td>
                      <td>${dto.book_name}</td>
                      <td>${dto.book_aseq}</td>
                      <td>${dto.lock_time}</td>
                      <td>
                      ${dto.lock_loan}
                      </td>
                      <td>${dto.locker_number}</td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
                  </div>
                </div>
              </div>
            </div>
		<div class="col-lg-6 mb-4">
              <!-- Approach -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">도서 보관함</h6>
                </div>
                <div class="card-body">
                 <table class="table table-bordered" style="text-align: center;">
                 <c:forEach var="i" begin="1" end="12">
                 	
                 
                 </c:forEach>
                 <tr>
                 <td>
                  <div class="px-3 py-5 bg-gradient-primary text-white" >1</div>
                 </td>
                 <td>
                  <div class="px-3 py-5 bg-gradient-primary text-white" >2</div>
                 </td>
                 <td>
                  <div class="px-3 py-5 bg-gradient-primary text-white" >3</div>
                 </td>
                 <td>
                  <div class="px-3 py-5 bg-gradient-success text-white" >4</div>
                 </td>
                 </tr>
                 <tr>
                 <td>
                  <div class="px-3 py-5 bg-gradient-danger text-white" >5</div>
                 </td>
                 <td>
                  <div class="px-3 py-5 bg-gradient-primary text-white" >6</div>
                 </td>
                 <td>
                  <div class="px-3 py-5 bg-gradient-primary text-white" >7</div>
                 </td>
                 <td>
                  <div class="px-3 py-5 bg-gradient-primary text-white" >8</div>
                 </td>
                 </tr>
                 <tr>
                 <td>
                  <div class="px-3 py-5 bg-gradient-primary text-white" >9</div>
                 </td>
                 <td>
                  <div class="px-3 py-5 bg-gradient-primary text-white" >10</div>
                 </td>
                 <td>
                  <div class="px-3 py-5 bg-gradient-primary text-white" >11</div>
                 </td>
                 <td>
                  <div class="px-3 py-5 bg-gradient-primary text-white" >12</div>
                 </td>
                 </tr>
                 </tbody>
                 </table>
                </div>
              </div>
			</div>
          </div>
        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->
      
  <!-- Modal -->
  <div class="modal fade" id="bookch" role="dialog">
    <div class="modal-dialog">
    
<div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">도서 리스트</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" id="frmR" >
        </div>
      </div>
    </div>
  </div>


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
  <script src="./resources/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="./resources/js/demo/chart-area-demo.js"></script>
  <script src="./resources/js/demo/chart-pie-demo.js"></script>

	<script type="text/javascript">
	function bookch(val) {
		ajaxbookch(val);
		$("#bookch").modal();
		
	}

	var ajaxbookch=function(val){
		$.ajax({
			url:'./bookch.do?cseq='+val,
			type:'post',
			dataType:'json',
			success: function(msg) {
				var body=$("#frmR");
				var htmls ="<table class=\"table table-bordered\" id=\"dataTable\" width=\"100%\" cellspacing=\"0\">\n" + 
				"                  <thead>\n" + 
				"                    <tr>\n" + 
				"                      <th>번호</th>\n" + 
				"                      <th>대출상태</th>\n" + 
				"                      <th>청구기호</th>\n" + 
				"                      <th>자료등록일</th>\n" + 
				"                      <th>도서선택</th>\n" + 
				"                    </tr>"+
				"				</thead>"+
				"<tbody>";
				$.each(msg,function(key,value){
					if(key=="lists"){
						for (var i = 0; i < value.length; i++) {
					htmls+=
						"                    <tr>\n" + 
						"                      <td>"+(i+1)+"</td>\n";
						if(value[i].condition_borrow=="N"){
							htmls+="<td>대출가능</td>";
						}else{
							htmls+="<td>대출불가</td>";
						}
						htmls+="                      <td>"+value[i].book_aseq+"</td>\n" + 
						"                      <td>"+value[i].book_date+"</td>\n" + 
						"                      <td>"+
						"<button onclick=\"saveBooknum("+value[i].book_aseq+","+value[i].book_cseq+")\">선택</button>"+
						"</td>\n" + 
						"                    </tr>";
						}
					}
				});
				
				htmls+="</tbody>"+
				"</table>";
				
				body.html(htmls);
				
			},
			error: function() {
				alert("error")
			}
		});

	}
	
	
	
	function saveBooknum(aseq,cseq) {
		var frmbseq=document.getElementById("frmbseq"+cseq);
		frmbseq.setAttribute("value", aseq);
		$("#bookch").modal("hide");
	}
	
	function savech() {
		
	}
	</script>

</body>

</html>