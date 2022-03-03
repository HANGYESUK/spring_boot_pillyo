<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/CSS/fa/css/all.css">
    <link href="/CSS/chatBot.css" rel="stylesheet">
    <title>Document</title>
</head>
<body>
    <div class="chatBot-Container colum" style="justify-content: center;">
        <div class="chatBot-TextBox">

            <div class="header">
                <div class="header-profile flex-row">
                    <img id="logo" src="./img/Group 66.png">
                    <div class="flex-colunm icon-box">
                        <div id="chatBot-Title"><h2>Pill-Yo</h2></div>
                    </div>
                </div>
                <div class="flex-column" style="margin-right: 20px;">
                    <div class="menu-icon" onclick="toggleChatBot()"><h2>X</h2></div>
                </div>
            </div>

            <div id="chating-container">
                <div class="you-chat">
                    <div class="text-box">
                        안녕하세요!
                    </div>
                    <div class="text-box">
                        무엇을 알려드릴까요??
                    </div>
                </div>
            </div>
            <div class="chat-box">
                <div class="chat-input">
                    <input id="text-input"
                    onkeyup="if(window.event.keyCode==13){go()}">
                    <div><button type="submit" id="sumit" onclick="go()">전송</button></div>
                </div>
                <div>
                    <div class="icon-container">
                        <div><i class="far fa-smile"></i></div>
                        <div><label for="file-load"><i class="fas fa-paperclip"></i></label></div>
                        <input type="file" id="file-load" style="display: none;" onchange="goImg(this)">
                        <div><i class="far fa-calendar-check"></i></div>
                        <div><i class="fas fa-border-none"></i></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="chatBot-Icon flex-row" onclick="toggleChatBot()">
            <img id="icon" src="./img/Group 66.png">
        </div>
    </div>


    <script type="text/javascript">
		 // let btn = document.getElementById("submit");
		
		 // let my_chat = document.getElementsByClassName("my-chat")[0]
		
		
		
		 // btn.addEventListener("click", function() {
		//      let text = document.getElementById("text-input").value
		//      let my_chat = document.createElement("div")
		//      my_chat.innerHTML = text
		//      my_chat.setAttribute("class", "text-box")
		 // });
		
		 // let my_chat = document.getElementsByClassName("my-chat")[0]
		
		 
		$(document).ready(()=>{
            let chatBot = document.getElementsByClassName("chatBot-TextBox")[0]
		    chatBot.classList.add('visibility-hidden')
        });
        
        $("#chating-container").on('scroll', function(e) {
        	
        	e.preventDefault();
        	e.stopPropagation();
        });
        
     
		
		
		 function go() {
		     let text = document.getElementById("text-input")
		     let chatingContainer = document.getElementById("chating-container")
		     console.log(text.value)
		  

		     if(text.value == "") {
		         preventDefault()
		  }
		     else {
		         let my_chat = document.createElement("div")
		         my_chat.classList.add("my-chat")
		         let text_box = document.createElement("div")
		         text_box.innerHTML = text.value
		         text_box.classList.add("text-box")
		         my_chat.appendChild(text_box)
		         chatingContainer.appendChild(my_chat)
		         text.value = null;
		         // let text_input = document.getElementsByClassName("text-input")[0]
		         // text_input.innerHTML = null
		         // text.innerHTML = null
		     }
		     
		 	$("#chating-container").scrollTop($("#chating-container").prop("scrollHeight"));

		 }
		
		
		 function goImg(add) {
		     let chatingContainer = document.getElementById("chating-container")
		     let file = add.files[0];
		     var newImage = document.createElement("img");
		     newImage.src = URL.createObjectURL(file);
		     let my_chat = document.createElement("div")
		     my_chat.classList.add("my-chat")
		     let text_box = document.createElement("div")
		     text_box.classList.add("text-box")
		     text_box.appendChild(newImage)
		     my_chat.appendChild(text_box)
		     chatingContainer.appendChild(my_chat)
		     
		     $("#chating-container").scrollTop($("#chating-container").prop("scrollHeight"));
		 }
		
		 function toggleChatBot() {
		     let chatBot = document.getElementsByClassName("chatBot-TextBox")[0]
		     chatBot.classList.toggle('visibility-hidden')
		 }
		
		 // let input_img = document.getElementById("file=load").value
		 // console.log(input_img)
    </script>

</body>
</html>