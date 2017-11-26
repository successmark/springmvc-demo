<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
	<spring:message code="label_book_new" var="labelBookNew" />
	<spring:message code="label_book_update" var="labelBookUpdate" />
	<spring:message code="label_book_name" var="labelBookName" />
	<spring:message code="label_book_publisher" var="labelBookPublisher" />
	<spring:message code="label_date_of_publication" var="labelDateOfPublication" />
	<spring:message code="label_book_description" var="labelBookDescription" />
	<spring:message code="label_book_photo" var="labelBookPhoto" />
	
	<spring:eval expression="book.id == null ? labelBookNew:labelBookUpdate"
		var="formTitle" />

	<script>
	/* $(function(){
		$('#dateOfPublication').datepicker({
			dateFormat: 'yy-mm-dd',
			changeYear: true
		});

		$("#bookDescription").ckeditor(
			{
				toolbar : 'Basic',
				uiColor : '#CCCCCC'
			}
		);
	}); */
	</script>
	<body>
	<h1>${formTitle}</h1>
	<div id="bookUpdate">
		<form:form modelAttribute="book" id="bookUpdateForm"
			method="post" enctype="multipart/form-data">
			<c:if test="${not empty message}">
				<div id="message" class="${message.type}">${message.message}</div>
			</c:if>
			<form:label path="name">	
				${labelBookName}*
			</form:label>
			<form:input path="name" size="60"/>
			<div>
				<form:errors path="name" cssClass="error" />
			</div>
			<p />
			<form:label path="publisher">
				${labelBookPublisher}*
			</form:label>
			<form:input path="publisher"  size="60"/>
			<div>
				<form:errors path="publisher" cssClass="error" />
			</div>
			<p />
			<form:label path="dateOfPublication">
				${labelDateOfPublication}
			</form:label>
			<form:input path="dateOfPublication" id="dateOfPublication" />
			<div>
				<form:errors path="dateOfPublication" cssClass="error" />
			</div>
			<p />
			<form:label path="description">
				${labelBookDescription}
			</form:label>
			<form:textarea cols="60" rows="8" path="description"
				id="bookDescription" />
			<div>
				<form:errors path="description" cssClass="error" />
			</div>
			<p />
			
			<label for="file">
				${labelBookPhoto}
			</label>
			<input name="file" type="file"/>
			<p/>
			
			<form:hidden path="version" />
			
			<button type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
           		<span class="ui-button-text">Save</span>
        	</button> 
       		<button type="reset" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
           		<span class="ui-button-text">Reset</span>
        	</button>  
        	
		</form:form>
	</div>
	</body>
</html>