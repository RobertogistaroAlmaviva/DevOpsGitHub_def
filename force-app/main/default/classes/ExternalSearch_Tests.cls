@isTest
private class ExternalSearch_Tests {
  @isTest static void negativo() {
    HttpMockFactory mock = new HttpMockFactory(500, 'no', 'I not found it!', new Map<String,String>());
    Test.setMock(HttpCalloutMock.class, mock);
    String result;
    Test.startTest();
      result = ExternalSearch.googleIt('epic search');
    Test.stopTest();
    system.assertEquals('Did not recieve a 200 status code: 500', result); 
  }
    @isTest static void positivo() {
    HttpMockFactory mock = new HttpMockFactory(200, 'no', 'I found it!', new Map<String,String>());
    Test.setMock(HttpCalloutMock.class, mock);
    String result;
    Test.startTest();
      result = ExternalSearch.googleIt('epic search');
    Test.stopTest();
    system.assertEquals('I found it!', result); 
  }
}