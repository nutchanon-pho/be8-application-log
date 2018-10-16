@isTest
private class ApplicationLoggerTest {

    @testSetup static void testSetup(){
		ApplicationLogSetting__c appLogSetting = new ApplicationLogSetting__c();
        appLogSetting.Debug__c   = true;
        appLogSetting.Error__c   = true;
        appLogSetting.Info__c    = true;
        appLogSetting.Warning__c = true;

        insert appLogSetting;
	}
    @isTest static void testApplicationLoggerControllerDebug() {
        ApplicationLog__c eachLog = new ApplicationLog__c();
        eachLog.Class__c                  = 'MyClass';
        eachLog.DebugLevel__c             = ApplicationLogger.debugLevel.Debug.name();
        eachLog.Endpoint__c               = 'No Endpoint';
        eachLog.ExceptionMessage__c       = 'No Exception';
        eachLog.Function__c               = 'TestApplicationLog';
        eachLog.Message__c                = 'Test Message';
        eachLog.ReferenceId__c            = 'Reference ID';
        eachLog.ReferenceInformation__c   = 'Reference Information';
        eachLog.SendEmailAlert__c         = false;
        eachLog.StackTrace__c             = 'StackTrace';
        Map<String, String> attachmentMap = new Map<String, String>();
        attachmentMap.put('TestApplicationLog','TestApplicationLog');

        Test.startTest();
        ApplicationLogger.addLogModel(eachLog, attachmentMap);
        Test.stopTest();
    }


    @isTest static void testApplicationLoggerControllerInfo() {
        ApplicationLog__c eachLog = new ApplicationLog__c();
        eachLog.Class__c                  = 'MyClass';
        eachLog.DebugLevel__c             = ApplicationLogger.debugLevel.Info.name();
        eachLog.Endpoint__c               = 'No Endpoint';
        eachLog.ExceptionMessage__c       = 'No Exception';
        eachLog.Function__c               = 'TestApplicationLog';
        eachLog.Message__c                = 'Test Message';
        eachLog.ReferenceId__c            = 'Reference ID';
        eachLog.ReferenceInformation__c   = 'Reference Information';
        eachLog.SendEmailAlert__c         = false;
        eachLog.StackTrace__c             = 'StackTrace';
        Map<String, String> attachmentMap = new Map<String, String>();
        attachmentMap.put('TestApplicationLog','TestApplicationLog');

        Test.startTest();
        ApplicationLogger.addLogModel(eachLog, attachmentMap);
        Test.stopTest();
    }


    @isTest static void testApplicationLoggerControllerError() {
        ApplicationLog__c eachLog = new ApplicationLog__c();
        eachLog.Class__c                  = 'MyClass';
        eachLog.DebugLevel__c             = ApplicationLogger.debugLevel.Error.name();
        eachLog.Endpoint__c               = 'No Endpoint';
        eachLog.ExceptionMessage__c       = 'No Exception';
        eachLog.Function__c               = 'TestApplicationLog';
        eachLog.Message__c                = 'Test Message';
        eachLog.ReferenceId__c            = 'Reference ID';
        eachLog.ReferenceInformation__c   = 'Reference Information';
        eachLog.SendEmailAlert__c         = false;
        eachLog.StackTrace__c             = 'StackTrace';
        Map<String, String> attachmentMap = new Map<String, String>();
        attachmentMap.put('TestApplicationLog','TestApplicationLog');

        Test.startTest();
        ApplicationLogger.addLogModel(eachLog, attachmentMap);
        Test.stopTest();
    }


    @isTest static void testApplicationLoggerControllerWarning() {
        ApplicationLog__c eachLog = new ApplicationLog__c();
        eachLog.Class__c                  = 'MyClass';
        eachLog.DebugLevel__c             = ApplicationLogger.debugLevel.Warning.name();
        eachLog.Endpoint__c               = 'No Endpoint';
        eachLog.ExceptionMessage__c       = 'No Exception';
        eachLog.Function__c               = 'TestApplicationLog';
        eachLog.Message__c                = 'Test Message';
        eachLog.ReferenceId__c            = 'Reference ID';
        eachLog.ReferenceInformation__c   = 'Reference Information';
        eachLog.SendEmailAlert__c         = false;
        eachLog.StackTrace__c             = 'StackTrace';
        Map<String, String> attachmentMap = new Map<String, String>();
        attachmentMap.put('TestApplicationLog','TestApplicationLog');

        Test.startTest();
        ApplicationLogger.addLogModel(eachLog, attachmentMap);
        Test.stopTest();
    }


    @isTest static void testApplicationLoggerControllerInsertModel() {
        ApplicationLog__c eachLog = new ApplicationLog__c();
        eachLog.Class__c                  = 'MyClass';
        eachLog.DebugLevel__c             = ApplicationLogger.debugLevel.Debug.name();
        eachLog.Endpoint__c               = 'No Endpoint';
        eachLog.ExceptionMessage__c       = 'No Exception';
        eachLog.Function__c               = 'TestApplicationLog';
        eachLog.Message__c                = 'Test Message';
        eachLog.ReferenceId__c            = 'Reference ID';
        eachLog.ReferenceInformation__c   = 'Reference Information';
        eachLog.SendEmailAlert__c         = false;
        eachLog.StackTrace__c             = 'StackTrace';
        Map<String, String> attachmentMap = new Map<String, String>();
        attachmentMap.put('TestApplicationLog','TestApplicationLog');

        Test.startTest();
        ApplicationLogger.addLogModel(eachLog, attachmentMap);
        ApplicationLogger.insertLogModel();
        Test.stopTest();
    }
}
