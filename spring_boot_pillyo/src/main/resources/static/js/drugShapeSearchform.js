/**
 * drugShapeSearchForm.js 
 */
 
 

$(document).ready(function() {
 
 
 //약 모양 하나만 체크할수 있게
 $('input[type="checkbox"][name="drug_shape"]').click(function(){
 
  if($(this).prop('checked')){
 
     $('input[type="checkbox"][name="drug_shape"]').prop('checked',false);
 
     $(this).prop('checked',true);
 
    }
  
   });
  
  //색깔 하나만 체크할수 있게
  $('input[type="checkbox"][name="color_class"]').click(function(){
 
  if($(this).prop('checked')){
 
     $('input[type="checkbox"][name="color_class"]').prop('checked',false);
 
     $(this).prop('checked',true);
 
    }
  
   });
  
   //제형 하나만 체크할수 있게
  $('input[type="checkbox"][name="form_code_name"]').click(function(){
 
  if($(this).prop('checked')){
 
     $('input[type="checkbox"][name="form_code_name"]').prop('checked',false);
 
     $(this).prop('checked',true);
 
    }
  
   });
  
   //분할선 하나만 체크할수 있게
  $('input[type="checkbox"][name="line_front"]').click(function(){
 
  if($(this).prop('checked')){
 
     $('input[type="checkbox"][name="line_front"]').prop('checked',false);
 
     $(this).prop('checked',true);
 
    }
  
   });
 });
   