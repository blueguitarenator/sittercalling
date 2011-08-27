// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

if($) {
  $(document).ready(
    function() {
      $('#flash').delay(500).fadeIn('normal', function() {
        $(this).delay(2500).fadeOut();
      });
      
        
      Date.format = 'yyyy-mm-dd';
      Date.firstDayOfWeek = 0;
      $.datepicker.setDefaults({ dateFormat: 'yy-mm-dd' });
      $('#event_event_date').datepicker();
    }
  );
}
