class StoreKeyParams {
  String mnemonic = "";
  String name = "";
  String password = "";
  int coinType = -1;

  StoreKeyParams(String mnemonic, String name, String password, int coinType) {
    this.mnemonic = mnemonic;
    this.name = name;
    this.password = password;
    this.coinType = coinType;
  }
}