class GSTnumber{
  String error;
  String message;

  GSTnumber(this.error,this.message);

  GSTnumber.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
  }
}