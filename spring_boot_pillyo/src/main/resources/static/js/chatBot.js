// let btn = document.getElementById("submit");

// let my_chat = document.getElementsByClassName("my-chat")[0]



// btn.addEventListener("click", function() {
//     let text = document.getElementById("text-input").value
//     let my_chat = document.createElement("div")
//     my_chat.innerHTML = text
//     my_chat.setAttribute("class", "text-box")
// });

// let my_chat = document.getElementsByClassName("my-chat")[0]



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
}

function toggle() {
    let chatBot = document.getElementsByClassName("chatBot-TextBox")[0]
    chatBot.classList.toggle('visibility-hidden')
}

// let input_img = document.getElementById("file=load").value
// console.log(input_img)