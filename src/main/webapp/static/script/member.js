function go_next() {
    if (document.contractForm.agree[1].checked === true) {
        alert('회원 약관에 동의 하셔야 회원으로 가입이 가능합니다');
    } else {
        document.contractForm.submit();
    }
}

/*function idCheck() {
    $idCheckBtn = document.getElementById("idCheckBtn");
    $idUseBtn = document.getElementById("idUseBtn");
    $inputId = document.getElementById("id");
    $msgBox = document.getElementById("msgBox");

    let xhr = new XMLHttpRequest();
    xhr.open("GET", 'idcheck?id=' + $inputId.value, true);
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            let data = xhr.responseText;
            if (data === "1") {
                $msgBox.innerText = "사용가능한 아이디입니다";
                $idUseBtn.style.display = "block";
            } else if (data === "-1") {
                $msgBox.innerText = "이미 사용중인 아이디입니다";
                $idUseBtn.style.display = "none";
                $inputId.value = "";
                $inputId.focus();
            } else {
                $msgBox.innerText = "아이디를 입력하세요";
                $idUseBtn.style.display = "none";
            }
            $idUseBtn.addEventListener("click", () => {
                $msgBox.innerText = "";
                $idUseBtn.style.display = "none";
            })
        } else {
            $msgBox.innerText = "AJAX ERROR"
        }
    }
    xhr.send();
}*/

function idCheck() {
    $idCheckBtn = document.getElementById("idCheckBtn");
    $idUseBtn = document.getElementById("idUseBtn");
    $inputId = document.getElementById("id");
    $msgBox = document.getElementById("msgBox");

    fetch('idcheck?id='+ $inputId.value)
        .then(res =>{
            if(res.ok){
                return res.json();
            }else{
                console.log("error : " + res.statusText);
            }
        })
        .then(data =>{
            console.log(data);
            $msgBox.innerText = data.message;

            switch(data.status){
                case "100":
                    $idUseBtn.style.display = "block";
                    break;
                case "200":
                    $idUseBtn.style.display = "none";
                    break;
                case "300":
                    $idUseBtn.style.display = "none";
            }

            $idUseBtn.addEventListener("click", ()=>{
                $msgBox.innerText = "";
                $idUseBtn.style.display = "none";
            })
        })
        .catch(err =>{
            console.log("err : " + err);
        })
}