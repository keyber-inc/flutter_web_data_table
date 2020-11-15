class SampleData {
  List<Map<String, dynamic>> get data =>
      sampleDataRows.map((row) => row.values).toList();

  final List<SampleDataRow> sampleDataRows = [
    SampleDataRow.fromList(
        ['Trident', 'Internet Explorer 4.0', 'Win 95+', '4', 'X']),
    SampleDataRow.fromList(
        ['Trident', 'Internet Explorer 5.0', 'Win 95+', '5', 'C']),
    SampleDataRow.fromList(
        ['Trident', 'Internet Explorer 5.5', 'Win 95+', '5.5', 'A']),
    SampleDataRow.fromList(
        ['Trident', 'Internet Explorer 6', 'Win 98+', '6', 'A']),
    SampleDataRow.fromList(
        ['Trident', 'Internet Explorer 7', 'Win XP SP2+', '7', 'A']),
    SampleDataRow.fromList(
        ['Trident', 'AOL browser (AOL desktop)', 'Win XP', '6', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Firefox 1.0', 'Win 98+ / OSX.2+', '1.7', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Firefox 1.5', 'Win 98+ / OSX.2+', '1.8', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Firefox 2.0', 'Win 98+ / OSX.2+', '1.8', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Firefox 3.0', 'Win 2k+ / OSX.3+', '1.9', 'A']),
    SampleDataRow.fromList(['Gecko', 'Camino 1.0', 'OSX.2+', '1.8', 'A']),
    SampleDataRow.fromList(['Gecko', 'Camino 1.5', 'OSX.3+', '1.8', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Netscape 7.2', 'Win 95+ / Mac OS 8.6-9.2', '1.7', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Netscape Browser 8', 'Win 98SE+', '1.7', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Netscape Navigator 9', 'Win 98+ / OSX.2+', '1.8', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Mozilla 1.0', 'Win 95+ / OSX.1+', '1', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Mozilla 1.1', 'Win 95+ / OSX.1+', '1.1', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Mozilla 1.2', 'Win 95+ / OSX.1+', '1.2', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Mozilla 1.3', 'Win 95+ / OSX.1+', '1.3', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Mozilla 1.4', 'Win 95+ / OSX.1+', '1.4', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Mozilla 1.5', 'Win 95+ / OSX.1+', '1.5', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Mozilla 1.6', 'Win 95+ / OSX.1+', '1.6', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Mozilla 1.7', 'Win 98+ / OSX.1+', '1.7', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Mozilla 1.8', 'Win 98+ / OSX.1+', '1.8', 'A']),
    SampleDataRow.fromList(
        ['Gecko', 'Seamonkey 1.1', 'Win 98+ / OSX.2+', '1.8', 'A']),
    SampleDataRow.fromList(['Gecko', 'Epiphany 2.20', 'Gnome', '1.8', 'A']),
    SampleDataRow.fromList(['Webkit', 'Safari 1.2', 'OSX.3', '125.5', 'A']),
    SampleDataRow.fromList(['Webkit', 'Safari 1.3', 'OSX.3', '312.8', 'A']),
    SampleDataRow.fromList(['Webkit', 'Safari 2.0', 'OSX.4+', '419.3', 'A']),
    SampleDataRow.fromList(['Webkit', 'Safari 3.0', 'OSX.4+', '522.1', 'A']),
    SampleDataRow.fromList(['Webkit', 'OmniWeb 5.5', 'OSX.4+', '420', 'A']),
    SampleDataRow.fromList(
        ['Webkit', 'iPod Touch / iPhone', 'iPod', '420.1', 'A']),
    SampleDataRow.fromList(['Webkit', 'S60', 'S60', '413', 'A']),
    SampleDataRow.fromList(
        ['Presto', 'Opera 7.0', 'Win 95+ / OSX.1+', '-', 'A']),
    SampleDataRow.fromList(
        ['Presto', 'Opera 7.5', 'Win 95+ / OSX.2+', '-', 'A']),
    SampleDataRow.fromList(
        ['Presto', 'Opera 8.0', 'Win 95+ / OSX.2+', '-', 'A']),
    SampleDataRow.fromList(
        ['Presto', 'Opera 8.5', 'Win 95+ / OSX.2+', '-', 'A']),
    SampleDataRow.fromList(
        ['Presto', 'Opera 9.0', 'Win 95+ / OSX.3+', '-', 'A']),
    SampleDataRow.fromList(
        ['Presto', 'Opera 9.2', 'Win 88+ / OSX.3+', '-', 'A']),
    SampleDataRow.fromList(
        ['Presto', 'Opera 9.5', 'Win 88+ / OSX.3+', '-', 'A']),
    SampleDataRow.fromList(['Presto', 'Opera for Wii', 'Wii', '-', 'A']),
    SampleDataRow.fromList(['Presto', 'Nokia N800', 'N800', '-', 'A']),
    SampleDataRow.fromList(
        ['Presto', 'Nintendo DS browser', 'Nintendo DS', '8.5', 'C/A']),
    SampleDataRow.fromList(['KHTML', 'Konqureror 3.1', 'KDE 3.1', '3.1', 'C']),
    SampleDataRow.fromList(['KHTML', 'Konqureror 3.3', 'KDE 3.3', '3.3', 'A']),
    SampleDataRow.fromList(['KHTML', 'Konqureror 3.5', 'KDE 3.5', '3.5', 'A']),
    SampleDataRow.fromList(
        ['Tasman', 'Internet Explorer 4.5', 'Mac OS 8-9', '-', 'X']),
    SampleDataRow.fromList(
        ['Tasman', 'Internet Explorer 5.1', 'Mac OS 7.6-9', '1', 'C']),
    SampleDataRow.fromList(
        ['Tasman', 'Internet Explorer 5.2', 'Mac OS 8-X', '1', 'C']),
    SampleDataRow.fromList(
        ['Misc', 'NetFront 3.1', 'Embedded devices', '-', 'C']),
    SampleDataRow.fromList(
        ['Misc', 'NetFront 3.4', 'Embedded devices', '-', 'A']),
    SampleDataRow.fromList(['Misc', 'Dillo 0.8', 'Embedded devices', '-', 'X']),
    SampleDataRow.fromList(['Misc', 'Links', 'Text only', '-', 'X']),
    SampleDataRow.fromList(['Misc', 'Lynx', 'Text only', '-', 'X']),
    SampleDataRow.fromList(['Misc', 'IE Mobile', 'Windows Mobile 6', '-', 'C']),
    SampleDataRow.fromList(['Misc', 'PSP browser', 'PSP', '-', 'C']),
  ];
}

class SampleDataRow {
  SampleDataRow._({
    this.renderingEngine,
    this.browser,
    this.platform,
    this.engineVersion,
    this.cssGrade,
  });

  factory SampleDataRow.fromList(List<String> values) {
    return SampleDataRow._(
      renderingEngine: values[0],
      browser: values[1],
      platform: values[2],
      engineVersion: values[3],
      cssGrade: values[4],
    );
  }

  final String renderingEngine;
  final String browser;
  final String platform;
  final String engineVersion;
  final String cssGrade;

  Map<String, dynamic> get values {
    return {
      'renderingEngine': renderingEngine,
      'browser': browser,
      'platform': platform,
      'engineVersion': engineVersion,
      'cssGrade': cssGrade,
    };
  }
}
