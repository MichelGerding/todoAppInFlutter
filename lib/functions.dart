class Functions {
  static String truncateString(int cutoff, String str) {
    return (str.length <= cutoff) ? str : str.substring(0, cutoff);
  }
}
