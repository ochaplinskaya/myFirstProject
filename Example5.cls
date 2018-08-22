public class Example5 {

    public static void func() {
        List<sObject> duplicateSObjects = new List<sObject>();
        duplicateSObjects.addAll(Example5.findDuplicates('Contact'));
        duplicateSObjects.addAll(Example5.findDuplicates('Lead'));
        if (!duplicateSObjects.isEmpty()) {
            delete duplicateSObjects;
        }
    }

    public static List<sObject> findDuplicates(String objectType) {
        List<sObject> duplicates = new List<sObject>();
        List<Object> uniqueNameList = new List<Object>();
        List<sObject> sObjectList = Database.query('SELECT Id, Name FROM ' + objectType);
        if (!sObjectList.isEmpty()) {
            for (sObject sObj : sObjectList) {
                Object name = sObj.get('Name');
                if (!uniqueNameList.contains(name)) {
                    uniqueNameList.add(name);
                } else {
                    duplicates.add(sObj);
                }
            }
        }
        return duplicates;
    }

}
//    public static void func() {
//        list<contact> list1 = [select id,name,phone, email from contact];
//        list<contact> list1new = new list<contact>();
//        for (contact c : list1) {
//            Boolean f = false;
//            integer i = 0;
//            for (i = 0; i < list1new.size(); i++) {
//                if (c.Name == list1new[i].Name) {
//                    f = true;
//                }
//
//            }
//            if (f != true) {
//                list1new.add(c);
//            }
//        }
//        list<Contact> list1newt = new list<contact>();
//        for (integer i = 0; i < list1.size(); i++) {
//            boolean f = false;
//            for (integer j = 0; j < list1new.size(); j++) {
//                if (list1[i].id == list1new[j].id) {
//                    f = true;
//                }
//            }
//            if (!f) {
//                list1newt.add(list1[i]);
//            }
//        }
//        delete list1newt;
//        list<lead> list2 = [select id,name,phone, email,title from Lead];
//        list<lead> list2new = new list<lead>();
//        for (lead c : list2) {
//            Boolean f = false;
//            integer i = 0;
//            for (i = 0; i < list2new.size(); i++) {
//                if (c.Name == list2new[i].Name) {
//                    f = true;
//                }
//
//            }
//            if (f != true) {
//                list2new.add(c);
//            }
//        }
//        list<Lead> list2newt = new list<lead>();
//        for (integer i = 0; i < list2.size(); i++) {
//            boolean f = false;
//            for (integer j = 0; j < list2new.size(); j++) {
//                if (list2[i].id == list2new[j].id) {
//                    f = true;
//                }
//            }
//            if (!f) {
//                list2newt.add(list2[i]);
//            }
//        }
//        delete list2newt;
//    }
//}