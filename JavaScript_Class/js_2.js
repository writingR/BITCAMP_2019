//자바스크립트를 이용하여 선택창 띄우기

var select;
select = confirm("로그인 하시겠습니까?");

if(select)
{
    alert("로그인을 진행하겠습니다.");

}else{
    alert("창을 나갑니다.");
}