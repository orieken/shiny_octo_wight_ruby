/**
 * Created with JetBrains RubyMine.
 * User: Oscar Rieken
 * Date: 10/8/12
 * Time: 1:29 PM
 * To change this template use File | Settings | File Templates.
 */

"form".onSubmit(function(event)  {
    event.stop();
    //this.send();
    this.send({
        onSuccess: function () {
            $('msg').load('/results');
        }
   });
});
