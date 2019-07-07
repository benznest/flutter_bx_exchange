class BxApiKey {
  String apiKey;
  String secret;

  BxApiKey({this.apiKey = "", this.secret = ""}){
    apiKey = apiKey.trim();
    secret = secret.trim();
  }


}