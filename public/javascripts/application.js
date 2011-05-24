// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
  function validateCheckboxes(){
    
        for (var x = 0, myBox = document.getElementById('check_module_' + x); myBox; x++, myBox = document.getElementById('check_module_' + x)) { //will loop through all boxes
            if ($('.check_modules:checked').length == 0) {
            
                alert("Please Check atleast one check box for Modules");
                return false;
            }
            else 
                if (($("#check_module_" + x).attr("checked") == true) && ($("#text_module_" + x).val() == '')) {
                    alert("Check Box is selected and text field is empty,Please fill appropriate text field");
                    return false;
                }
                else 
                    if (($("#check_module_" + x).attr("checked") == false) && ($("#text_module_" + x).val() != '')) {
                        alert("Text field is filled and Checkbox is not checked,Please check appropriate checkbox");
                        return false;
                    }
        }
    }