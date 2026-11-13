<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Admissions | Candidate Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="style.css">

</head>

<body>

    <div class="bg-glow orb-1"></div>
    <div class="bg-glow orb-2"></div>
    <div class="snow-container" id="snowContainer"></div>

    <div class="portal-wrapper">
        <!-- Hero Banner Side -->
        <div class="portal-banner">
            <div class="banner-content">
                <div class="banner-header-badge">
                    <svg viewBox="0 0 24 24">
                        <path d="M12 2v20M17 5l-10 14M19 12H5M5 5l14 14" />
                    </svg>
                    Winter Admissions 2026
                </div>
                <h2>Student Admissions Portal</h2>
                <p>Securely submit and verify your academic credentials into our decentralized cloud administration
                    records.</p>

                <div class="banner-features">
                    <div class="feature-item">
                        <svg viewBox="0 0 24 24">
                            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" />
                        </svg>
                        Instant credential verification
                    </div>
                    <div class="feature-item">
                        <svg viewBox="0 0 24 24">
                            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" />
                        </svg>
                        Encrypted SSL session storage
                    </div>
                    <div class="feature-item">
                        <svg viewBox="0 0 24 24">
                            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" />
                        </svg>
                        24/7 AI Admissions Advisor Support
                    </div>
                </div>
            </div>

            <div class="banner-footer">
                &copy; 2026 Academic Systems Inc. All rights reserved.
            </div>
        </div>

        <!-- Multi-Step Form Container -->
        <div class="portal-form-container">
            <!-- Stepper Indicator -->
            <div class="stepper">
                <div class="step-indicator active" id="indicator1">
                    <div class="step-number">1</div>
                    <span>Personal</span>
                </div>
                <div class="step-indicator" id="indicator2">
                    <div class="step-number">2</div>
                    <span>Academic</span>
                </div>
            </div>

            <div class="form-header">
                <h1 id="formTitle">Personal Information</h1>
                <p id="formSubtitle">Enter your basic candidate identification details.</p>
            </div>

            <form id="registrationForm" action="registrationController" method="post"
                onsubmit="return handleFinalSubmission(event)">

                <!-- STEP 1: Personal Details -->
                <div class="form-step active" id="step1">
                    <div class="form-grid">
                        <div class="form-group full-width">
                            <label for="fullname">Full Name</label>
                            <div class="input-wrapper">
                                <input type="text" id="fullname" name="fullname" placeholder="e.g., Alexander Wright">
                                <svg viewBox="0 0 24 24">
                                    <path
                                        d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z" />
                                </svg>
                            </div>
                            <div id="nameError" class="error-message">Full name is required.</div>
                        </div>

                        <div class="form-group full-width">
                            <label for="address">Residential Address</label>
                            <div class="input-wrapper">
                                <input type="text" id="address" name="address"
                                    placeholder="e.g., 42 Wallaby Way, Sydney">
                                <svg viewBox="0 0 24 24">
                                    <path
                                        d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z" />
                                </svg>
                            </div>
                            <div id="addressError" class="error-message">Valid address is required.</div>
                        </div>

                        <div class="form-group full-width">
                            <label for="age">Age</label>
                            <div class="input-wrapper">
                                <input type="text" id="age" name="age" placeholder="e.g., 21">
                                <svg viewBox="0 0 24 24">
                                    <path
                                        d="M19 3h-1V1h-2v2H8V1H6v2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H5V8h14v11z" />
                                </svg>
                            </div>
                            <div id="ageError" class="error-message">Enter valid age (1-120).</div>
                        </div>
                    </div>

                    <div class="btn-container">
                        <button type="button" class="btn-primary" onclick="nextStep()">Next Step &rarr;</button>
                    </div>
                </div>

                <!-- STEP 2: Academic Background -->
                <div class="form-step" id="step2">
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="yop">Year Passed</label>
                            <div class="input-wrapper">
                                <input type="text" id="yop" name="yop" placeholder="e.g., 2025">
                                <svg viewBox="0 0 24 24">
                                    <path
                                        d="M12 3L1 9l11 6 9-4.91V17h2V9L12 3zM5 13.18v4L12 21l7-3.82v-4L12 17l-7-3.82z" />
                                </svg>
                            </div>
                            <div id="yopError" class="error-message">Enter 4-digit year.</div>
                        </div>

                        <div class="form-group">
                            <label for="qual">Qualification</label>
                            <div class="input-wrapper">
                                <input type="text" id="qual" name="qual" placeholder="e.g., B.Tech CSE">
                                <svg viewBox="0 0 24 24">
                                    <path
                                        d="M18 2H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zM6 4h5v8l-2.5-1.5L6 12V4z" />
                                </svg>
                            </div>
                            <div id="qualError" class="error-message">Qualification required.</div>
                        </div>

                        <div class="form-group full-width">
                            <label for="percent">Percentage / CGPA</label>
                            <div class="input-wrapper">
                                <input type="text" id="percent" name="percent" placeholder="e.g., 88.5">
                                <svg viewBox="0 0 24 24">
                                    <path
                                        d="M18.5 5.5C18.5 7.43 16.93 9 15 9s-3.5-1.57-3.5-3.5S13.07 2 15 2s3.5 1.57 3.5 3.5zM4 18.5C4 16.57 5.57 15 7.5 15s3.5 1.57 3.5 3.5S9.43 22 7.5 22 4 20.43 4 18.5zM6.41 4.99L19.01 17.59l-1.42 1.42L4.99 6.41z" />
                                </svg>
                            </div>
                            <div id="percentError" class="error-message">Enter value between 0-100.</div>
                        </div>
                    </div>

                    <div class="btn-container">
                        <button type="button" class="btn-secondary" onclick="prevStep()">&larr; Back</button>
                        <button type="submit" class="btn-primary">Submit Application</button>
                    </div>
                </div>

            </form>
        </div>
    </div>

    <!-- Success Modal -->
    <div id="successModal">
        <div class="success-card">
            <h3>Submission Successful!</h3>
            <p>Candidate credentials have been validated and saved to the Winter 2026 directory.</p>
            <button onclick="closeModal()">Proceed to Dashboard</button>
        </div>
    </div>

    <!-- AI Chatbot Widget (Aria) -->
    <div class="chat-widget-btn" onclick="toggleChat()" title="Chat with Aria (AI Advisor)">
        <svg viewBox="0 0 24 24">
            <path
                d="M20 2H4c-1.1 0-2 .9-2 2v18l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zM6 9h12v2H6V9zm8 5H6v-2h8v2zm4-6H6V6h12v2z" />
        </svg>
    </div>

    <div class="chat-window" id="chatWindow">
        <div class="chat-header">
            <div class="chat-header-info">
                <div class="chat-avatar">AI</div>
                <div class="chat-title">
                    <h4>Aria - Admissions Advisor</h4>
                    <span>Online & Ready</span>
                </div>
            </div>
            <button class="chat-close" onclick="toggleChat()">
                <svg viewBox="0 0 24 24" width="18" height="18" fill="currentColor">
                    <path
                        d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" />
                </svg>
            </button>
        </div>

        <div class="chat-messages" id="chatMessages">
            <div class="message bot">Hello! I'm Aria, your virtual admissions consultant. Need help filling out your
                application or understanding eligibility criteria? Ask away!</div>
        </div>

        <!-- Quick Reply Chips -->
        <div class="chat-chips">
            <div class="chip" onclick="sendChip('What are the entry criteria?')">Eligibility Criteria</div>
            <div class="chip" onclick="sendChip('How do I format CGPA?')">CGPA Formatting</div>
            <div class="chip" onclick="sendChip('When is the deadline?')">Application Deadline</div>
        </div>

        <div class="typing-indicator" id="typingIndicator">
            <div class="typing-dot"></div>
            <div class="typing-dot"></div>
            <div class="typing-dot"></div>
        </div>

        <div class="chat-input-area">
            <input type="text" id="chatInput" placeholder="Ask Aria anything..." onkeypress="handleChatKeyPress(event)">
            <button class="chat-send-btn" onclick="sendChatMessage()">
                <svg viewBox="0 0 24 24">
                    <path d="M2.01 21L23 12 2.01 3 2 10l15 2-15 2z" />
                </svg>
            </button>
        </div>
    </div>

    <!-- Application Script -->
    <script src="script.js"></script>
</body>

</html>
