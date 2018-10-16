public without sharing class ApplicationLogger {
    private static ApplicationLogger instance;
    public static final String DEFAULT_TOOLONG_PAYLOAD = 'PAYLOAD IS TOO LARGE TO DISPLAY, PLEASE SEE IN ATTACHMENT';
    public enum debugLevel {Debug, Error, Info, Warning}
    public static final String LOG_NAME_PREFIX = 'ALOG-';
    public Map<String, List<Attachment>> attachModelMap = new Map<String, List<Attachment>>();
    public Map<String, ApplicationLog__c> logsModelMap = new Map<String, ApplicationLog__c>();
 
    public ApplicationLogger() {}

    public static ApplicationLogger getInstance() {
        if (instance == null) instance = new ApplicationLogger();
        return instance;
    }
    /*
    *   name   : addLogModel
    *   desc   : to add application log and it's attachment
    *   input  : eachLog       - ApplicationLog (Salesforce Object), 
    *            attachmentMap - Map of Attachment (Key = file name, Value = file content) 
    *            Note: The type of file content is in .txt
    *   output : -
    */
    public static void addLogModel(ApplicationLog__c eachLog, Map<String, String> attachmentMap){

        if(eachLog != null){
            if(isValidInsert(eachLog.DebugLevel__c)){
                DateTime currentDateTime         = Datetime.now();
                String strConvertedDate          = currentDateTime.format('dd-MM-yyyy\'T\'HH:mm:ss:SSS', ''+UserInfo.getTimeZone());
                eachLog.Name                     = LOG_NAME_PREFIX + strConvertedDate;
                eachLog.ExceptionMessage__c	     = getDefaultString(eachLog.ExceptionMessage__c	);
                eachLog.Message__c	             = getDefaultString(eachLog.Message__c);
                eachLog.ReferenceId__c	         = getDefaultString(eachLog.ReferenceId__c);
                eachLog.ReferenceInformation__c	 = getDefaultString(eachLog.ReferenceInformation__c);	                
                eachLog.StackTrace__c	         = getDefaultString(eachLog.StackTrace__c);	
                
                getInstance().logsModelMap.put(eachLog.Name, eachLog);

                if(attachmentMap != null && !attachmentMap.isEmpty()){
                    List<Attachment> attachList = attachmentMap.isEmpty() ? null : createAttachment(attachmentMap, eachLog.Class__c, eachLog.Function__c);
                    getInstance().attachModelMap.put(eachLog.Name, attachList);
                }
            }
        }
    }

    /*
    *   name   : insertLogModel
    *   desc   : insert application log and it's attachment
    *   input  : -
    *   output : -
    */
    public static void insertLogModel(){
        if (!getInstance().logsModelMap.isEmpty()) {
            List<Attachment> attachList = new List<Attachment>();
            insert getInstance().logsModelMap.values();
            for (ApplicationLog__c applog : getInstance().logsModelMap.values()) {
                if (getInstance().attachModelMap.get(applog.Name) != null) {
                    for (Attachment a : getInstance().attachModelMap.get(applog.Name)) {
                        a.ParentId = applog.Id;
                    }
                    attachList.addAll(getInstance().attachModelMap.get(applog.Name));
                }
            }
            Database.SaveResult[] result = Database.insert(attachList, false);
            getInstance().logsModelMap.clear();
            getInstance().attachModelMap.clear();
        }
    }
    
    /*
    *   name   : getDefaultString
    *   desc   : check and return default value if string value is too long
    *   input  : currentValue - Value to check length
    *   output : return value to display
    */
    private static String getDefaultString(String currentValue){
        return (currentValue.length() > 131072) ? DEFAULT_TOOLONG_PAYLOAD : currentValue;
    }

    /*
    *   name   : createAttachment
    *   desc   : to populate attachment of each application log
    *   input  : attachmentMap  - Map of Attachment (Key = file name, Value = file content) 
    *            sourceClass    - Related class of each attachment
    *            sourceFunction - Related function of each attachment
    *   output : Attachment List to Insert
    */
    public static List<Attachment> createAttachment(Map<String, String> attachmentMap, String sourceClass, String sourceFunction){
        List<Attachment> attachList = new List<Attachment>();
        for (String attachName : attachmentMap.keySet()) {
            Attachment attach       = new Attachment();
            attach.Name             = attachName + '_' + sourceClass + ' - ' + sourceFunction + '_' + System.currentTimeMillis();
            attach.Body             = Blob.valueOf(attachmentMap.get(attachName));
            attach.ContentType      = 'Text';
            attachList.add(attach);
        }
        return attachList;
    }

    /*
    *   name   : isValidInsert
    *   desc   : to check that specific debug level is valid to be inserted
    *   input  : debugLevel (String)
    *   output : isThatDebugLevelValidToInsert (Boolean)
    */
    private static Boolean isValidInsert(String eachDebugLevel) {
        Boolean isThatDebugLevelValidToInsert = false;

        ApplicationLogSetting__c orgWidSetting =  ApplicationLogSetting__c.getInstance();
        if (eachDebugLevel == debugLevel.Debug.name() && orgWidSetting.Debug__c) {
            isThatDebugLevelValidToInsert = true;
        }

        if (eachDebugLevel == debugLevel.Error.name()  && orgWidSetting.Error__c) {
            isThatDebugLevelValidToInsert = true;
        }

        if (eachDebugLevel == debugLevel.Info.name()  && orgWidSetting.Info__c) {
            isThatDebugLevelValidToInsert = true;
        }

        if (eachDebugLevel == debugLevel.Warning.name()  && orgWidSetting.Warning__c) {
            isThatDebugLevelValidToInsert = true;
        }
        return isThatDebugLevelValidToInsert;
    }


}
