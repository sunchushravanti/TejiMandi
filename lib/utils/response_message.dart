
class ResponseMessage{
String error="",success="";

ResponseMessage.withError(String errorMessage) {
    error = errorMessage;
  }
ResponseMessage.withSuccess(String successMessage) {
    success = successMessage;
  }

}
