<script>
function myFunction()
{
    var temp=document.getElementById('but').innerHTML;

    if(temp === "like")
    {
         document.getElementById('but').innerHTML = "unlike";
    }
    
    else if(temp === "unlike")
    {
         document.getElementById('but').innerHTML = "like";
        
    }
    temp = "unlike";
};

$(document).ready(function()
{
$('#but').click(function(){
 myFunction();

});
});

</script>
