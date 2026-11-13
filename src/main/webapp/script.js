// Snowfall Generation
const snowContainer = document.getElementById("snowContainer");
for (let i = 0; i < 30; i++) {
    const snowflake = document.createElement("div");
    snowflake.classList.add("snowflake");
    const size = Math.random() * 5 + 2;
    snowflake.style.width = size + "px";
    snowflake.style.height = size + "px";
    snowflake.style.left = Math.random() * 100 + "%";
    snowflake.style.animationDuration = (Math.random() * 6 + 4) + "s";
    snowflake.style.animationDelay = (Math.random() * 5) + "s";
    snowflake.style.opacity = Math.random() * 0.6 + 0.3;
    snowContainer.appendChild(snowflake);
}

// Form Fields & Auto-Save (LocalStorage)
const fieldIds = ["fullname", "address", "age", "yop", "qual", "percent"];

window.addEventListener("DOMContentLoaded", () => {
    fieldIds.forEach(id => {
        const saved = localStorage.getItem("nexus_" + id);
        if (saved) document.getElementById(id).value = saved;
        document.getElementById(id).addEventListener("input", (e) => {
            localStorage.setItem("nexus_" + id, e.target.value);
        });
    });
});

// Multi-Step Navigation
function nextStep() {
    const fullname = document.getElementById("fullname").value.trim();
    const address = document.getElementById("address").value.trim();
    const age = document.getElementById("age").value.trim();

    let valid = true;
    document.querySelectorAll("#step1 .shake").forEach(el => el.classList.remove("shake"));
    document.querySelectorAll("#step1 .error-message").forEach(el => el.classList.remove("show"));

    if (!fullname) {
        document.getElementById("fullname").classList.add("shake");
        document.getElementById("nameError").classList.add("show");
        valid = false;
    }
    if (!address) {
        document.getElementById("address").classList.add("shake");
        document.getElementById("addressError").classList.add("show");
        valid = false;
    }
    if (isNaN(age) || !age || Number(age) < 1 || Number(age) > 120) {
        document.getElementById("age").classList.add("shake");
        document.getElementById("ageError").classList.add("show");
        valid = false;
    }

    if (valid) {
        document.getElementById("step1").classList.remove("active");
        document.getElementById("step2").classList.add("active");
        document.getElementById("indicator1").classList.remove("active");
        document.getElementById("indicator2").classList.add("active");
        document.getElementById("formTitle").textContent = "Academic Background";
        document.getElementById("formSubtitle").textContent = "Provide your previous qualification details.";
        document.getElementById("portal-form-container")?.scrollTo(0, 0);
    }
}

function prevStep() {
    document.getElementById("step2").classList.remove("active");
    document.getElementById("step1").classList.add("active");
    document.getElementById("indicator2").classList.remove("active");
    document.getElementById("indicator1").classList.add("active");
    document.getElementById("formTitle").textContent = "Personal Information";
    document.getElementById("formSubtitle").textContent = "Enter your basic candidate identification details.";
}

function handleFinalSubmission(event) {
    event.preventDefault();
    let isValid = true;

    const yop = document.getElementById("yop").value.trim();
    const qual = document.getElementById("qual").value.trim();
    const percent = document.getElementById("percent").value.trim();

    document.querySelectorAll("#step2 .shake").forEach(el => el.classList.remove("shake"));
    document.querySelectorAll("#step2 .error-message").forEach(el => el.classList.remove("show"));

    if (isNaN(yop) || yop.length !== 4) {
        document.getElementById("yop").classList.add("shake");
        document.getElementById("yopError").classList.add("show");
        isValid = false;
    }
    if (!qual) {
        document.getElementById("qual").classList.add("shake");
        document.getElementById("qualError").classList.add("show");
        isValid = false;
    }
    if (isNaN(percent) || !percent || Number(percent) < 0 || Number(percent) > 100) {
        document.getElementById("percent").classList.add("shake");
        document.getElementById("percentError").classList.add("show");
        isValid = false;
    }

    if (isValid) {
        localStorage.clear();
        document.getElementById("successModal").classList.add("active");
    }
    return false;
}

function closeModal() {
    document.getElementById("registrationForm").submit();
}

// Chatbot Logic
let chatOpen = false;

function toggleChat() {
    const chatWindow = document.getElementById("chatWindow");
    chatOpen = !chatOpen;
    if (chatOpen) {
        chatWindow.classList.add("active");
        document.getElementById("chatInput").focus();
    } else {
        chatWindow.classList.remove("active");
    }
}

function handleChatKeyPress(event) {
    if (event.key === "Enter") sendChatMessage();
}

function sendChip(text) {
    document.getElementById("chatInput").value = text;
    sendChatMessage();
}

function sendChatMessage() {
    const input = document.getElementById("chatInput");
    const text = input.value.trim();
    if (!text) return;

    appendMessage(text, "user");
    input.value = "";
    showTypingIndicator();

    setTimeout(() => {
        hideTypingIndicator();
        const response = getAriaResponse(text);
        appendMessage(response, "bot");
    }, 900 + Math.random() * 400);
}

function appendMessage(text, sender) {
    const container = document.getElementById("chatMessages");
    const div = document.createElement("div");
    div.classList.add("message", sender);
    div.textContent = text;
    container.appendChild(div);
    container.scrollTop = container.scrollHeight;
}

function showTypingIndicator() {
    document.getElementById("typingIndicator").style.display = "flex";
    const container = document.getElementById("chatMessages");
    container.scrollTop = container.scrollHeight;
}

function hideTypingIndicator() {
    document.getElementById("typingIndicator").style.display = "none";
}

function getAriaResponse(input) {
    const lower = input.toLowerCase();
    if (lower.includes("criteria") || lower.includes("eligib")) {
        return "Applicants must hold a high school diploma or undergraduate degree with a minimum of 50% aggregate score to qualify for the Winter 2026 term.";
    } else if (lower.includes("cgpa") || lower.includes("percent")) {
        return "You can input your aggregate percentage directly (e.g., 88.5) or convert your CGPA into a 100-point scale equivalent.";
    } else if (lower.includes("deadline") || lower.includes("date")) {
        return "Applications for the Winter 2026 intake close on December 31, 2026. Make sure to submit your credentials before then!";
    } else if (lower.includes("hello") || lower.includes("hi")) {
        return "Hello! How can I assist you with your Nexus candidate registration today?";
    } else {
        return "That's a great question! For specific inquiries regarding your student profile or curriculum tracks, please complete your registration form or reach out to support@nexus-acad.edu.";
    }
}