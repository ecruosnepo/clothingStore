<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp" flush="false" />
<style>
        a{
        color: black;
        }
        .row{
          width: 980px;
          margin: 0 auto;
          }
          section{
            margin-left: 20%;
           }
        section h1{
            text-align: center;
        }
        section p{
        	float: right;
        }
        
		.btn-secondary {
		    color: black;
		    border: none;
		    background: none;
		}
        .btn-toolbar{
        	justify-content: center;
        }
        
        @media screen and (max-height: 450px) {
        .sidenav {padding-top: 15px;}
        .sidenav a {font-size: 18px;}
        }
        </style>
        <jsp:include page="sideNav.jsp" flush="false" />
      <section>
          <h1>문의 관리</h1><br><br>
			
          <form class="form-inline">
              <div class="input-group mb-2 mr-sm-2">
                <div class="input-group-prepend">
                  <div class="input-group-text">@</div>
                </div>
                <input type="text" class="form-control" id="inlineFormInputGroupUsername2" placeholder="User email">
              </div>
            
              <div class="form-check mb-2 mr-sm-2">
                <select id="inputState" name="boardCat" class="form-control" style="width: 200px;">
                  <option disabled selected>== 분류 ==</option>
                  <option value="배송">배송</option>
                  <option value="결제">결제</option>
                  <option value="반품">반품</option>
                  <option value="환불">환불</option>
                  <option value="기타">기타</option>
                </select>
              </div>
            
              <button type="submit" class="btn btn-primary mb-2">Submit</button>
            </form>

            <table class="table table-hover" id="qna">
                <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">상태</th>
                    <th scope="col">분류</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성일</th>
                </tr>
                </thead>
                <c:forEach items="${ list }" var="dto" varStatus="idx" begin="${ startIdx }" end="${ endIdx }" >
                    <tr>
                        <td scope="row"><a href="listView?id=${ dto.id }">${idx.index+1}</a></td>
                        <td>
                            <c:if test="${dto.b_check == '0'}">
                                <a href="listView?id=${ dto.id }">미확인</a>
                            </c:if>
                            <c:if test="${dto.b_check == '1'}">
                                <a href="listView?id=${ dto.id }">완료</a>
                            </c:if>
                        </td>
                        <td><a href="listView?id=${ dto.id }">${dto.boardCat}</a></td>
                        <td><a href="listView?id=${ dto.id }" id="title">${dto.title}</a></td>
                        <td><a href="listView?id=${ dto.id }">${dto.regDate}</a></td>
                    </tr>
                    </c:forEach>
            </table>
            <div> <p>${ thisPage }/${ totalPage } pages</p> </div><br>
            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                <div class="btn-group mr-2" role="group" aria-label="First group">
                		<c:if test="${startPageIdx > 1}">
                   			<button type="button" class="btn btn-secondary" onclick="location.href='/customerQna?page=${thisPage-1}' ">prev</button>
                   		</c:if>
                	<c:forEach varStatus="page" begin="${startPageIdx}" end="${ endPageIdx }" >
                   		<button type="button" class="btn btn-secondary" onclick="location.href='/customerQna?page=${page.index}' ">${page.index}</button>
                   </c:forEach>
                   <c:if test="${totalPage > endPageIdx}">
                   		<button type="button" class="btn btn-secondary" onclick="location.href='/customerQna?page=${thisPage+1}' ">next</button>
                   </c:if>
                </div>
            </div>
            <button type="button" class="btn btn-primary btn-lg" onclick="location.href='/customerQnaWriteForm' ">글쓰기</button>
        </section>
    </div>
    </div>
    </div>
<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>