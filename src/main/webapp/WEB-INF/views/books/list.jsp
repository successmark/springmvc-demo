<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<html>
	<spring:message code="label_book_list" var="labelBookList" />
	<spring:message code="label_book_name" var="labelBookName" />
	<spring:message code="label_book_publisher" var="labelBookPublisher" />
	<spring:message code="label_date_of_publication" var="labelDateOfPublication" />
	<spring:url value="/" var="showBookUrl" />
	<c:if test="${not empty message}">
		<div id="message" class="${message.type}">${message.message}</div>
	</c:if>
	<body>
	<h1>${labelBookList}</h1>

		<table>
			<thead>
				<tr>
					<th>${labelBookName}</th>
					<th>${labelBookPublisher}</th>
					<th>${labelDateOfPublication}</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${books}" var="book">
					<tr>
						<td><a href="${showBookUrl}${book.id}">${book.name}</a></td>
						<td>${book.publisher}</td>
						<td><joda:format value="${book.dateOfPublication}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</body>
</html>