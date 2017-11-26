<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
	<spring:message code="label_book_info" var="labelBookInfo" />
	<spring:message code="label_book_name" var="labelBookName" />
	<spring:message code="label_book_publisher" var="labelBookPublisher" />
	<spring:message code="label_date_of_publication" var="labelDateOfPublication" />
	<spring:message code="label_book_description" var="labelBookDescription" />
	<spring:message code="label_book_update" var="labelBookUpdate" />
	<spring:message code="label_book_delete" var="labelBookDelete" />
	<spring:message code="date_format_pattern" var="dateFormatPattern" />
	<spring:message code="label_book_photo" var="labelBookPhoto"/>
	
	<spring:url value="/photo" var="bookPhotoUrl"/>
	<spring:url value="/" var="editBookUrl" />
	<spring:url value="/delete" var="deleteBookUrl" />
	
	<!-- Create jQueryUI Edit/Delete Buttons -->
	<!-- <script>
  	$(function() {
	    $("#editBook")
      	.button()
      	.click(function() {
      	   window.location = "${editBookUrl}${book.id}?form";
      	});
	    
	    $("#deleteBook")
      	.button()
      	.click(function() {
      	   window.location = "${deleteBookUrl}/${book.id}";
      	});
  	}); -->
  	</script>
	<body>
	<h1>${labelBookInfo}</h1>
	
	<div id="bookInfo">

		<c:if test="${not empty message}">
			<div id="message" class="${message.type}">${message.message}</div>
		</c:if>
		<table>
			<tr>
				<td>${labelBookName}</td>
				<td>${book.name}</td>
			</tr>
			<tr>
				<td>${labelBookPublisher}</td>
				<td>${book.publisher}</td>
			</tr>
			<tr>
				<td>${labelDateOfPublication}</td>
				<td><joda:format value="${book.dateOfPublication}"
						pattern="${dateFormatPattern}" /></td>
			</tr>
			<tr>
				<td>${labelBookDescription}</td>
				<td>${book.description}</td>
			</tr>
			<tr><!-- File Upload area -->
				<td>${labelBookPhoto}</td>
				<td><img src="${bookPhotoUrl}/${book.id}"></img></td>
			</tr>
		</table>

		<%-- <sec:authorize access="hasRole('ROLE_USER')"> --%>
			<a id="editBook" href="${editBookUrl}${book.id}?form">${labelBookUpdate}</a>
			<a id="deleteBook" href="${deleteBookUrl}/${book.id}">${labelBookDelete}</a>
		<%-- </sec:authorize> --%>
	</div>
	</body>
</html>