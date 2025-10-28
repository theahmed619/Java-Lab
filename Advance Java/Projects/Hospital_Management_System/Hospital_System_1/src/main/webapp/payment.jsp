<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secure Payment - Razorpay</title>
    <%@include file="component/allcss.jsp"%>
    <!-- Bootstrap for Styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        /* Modern Payment Page Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        
        .payment-wrapper {
            min-height: 90vh;
            background: linear-gradient(135deg, rgba(106, 17, 203, 0.9) 0%, rgba(37, 117, 252, 0.9) 100%),
                         url('https://api.placeholder.com/400/320');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px 15px;
        }
        
        .payment-container {
            width: 100%;
            max-width: 480px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            animation: slideIn 0.6s ease-out forwards;
        }
        
        @keyframes slideIn {
            0% { transform: translateY(30px); opacity: 0; }
            100% { transform: translateY(0); opacity: 1; }
        }
        
        .payment-header {
            background: linear-gradient(to right, #3a7bd5, #00d2ff);
            color: white;
            padding: 25px;
            text-align: center;
            position: relative;
        }
        
        .payment-header h2 {
            margin: 0;
            font-weight: 700;
            font-size: 28px;
            letter-spacing: 0.5px;
        }
        
        .payment-header p {
            margin: 10px 0 0;
            opacity: 0.9;
            font-size: 16px;
            font-weight: 300;
        }
        
        .header-icon {
            position: absolute;
            top: -20px;
            right: -20px;
            background: #fff;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            color: #3a7bd5;
            font-size: 24px;
        }
        
        .payment-body {
            padding: 30px;
        }
        
        .payment-info {
            display: flex;
            justify-content: space-between;
            background: #f7f9fc;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 25px;
            border-left: 4px solid #3a7bd5;
        }
        
        .payment-info-item {
            text-align: center;
        }
        
        .payment-info-label {
            font-size: 12px;
            color: #7d8da6;
            margin-bottom: 5px;
        }
        
        .payment-info-value {
            font-size: 16px;
            font-weight: 700;
            color: #2e384d;
        }
        
        .qr-section {
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 25px;
            text-align: center;
            position: relative;
        }
        
        .qr-code {
            width: 200px;
            height: 200px;
            margin: 0 auto;
            padding: 10px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        
        .qr-code:hover {
            transform: scale(1.05);
        }
        
        .qr-instruction {
            margin-top: 15px;
            font-size: 14px;
            color: #6c757d;
        }
        
        .or-divider {
            display: flex;
            align-items: center;
            margin: 20px 0;
            color: #adb5bd;
        }
        
        .or-divider::before,
        .or-divider::after {
            content: "";
            flex: 1;
            border-bottom: 1px solid #dee2e6;
        }
        
        .or-divider-text {
            padding: 0 10px;
            text-transform: uppercase;
            font-weight: 600;
            font-size: 12px;
        }
        
        .payment-btn {
            display: block;
            width: 100%;
            background: linear-gradient(45deg, #3a7bd5, #00d2ff);
            color: white;
            border: none;
            padding: 15px;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(58, 123, 213, 0.3);
            text-decoration: none;
            text-align: center;
        }
        
        .payment-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(58, 123, 213, 0.4);
            color: white;
        }
        
        .payment-btn:active {
            transform: translateY(0);
        }
        
        .payment-btn i {
            margin-right: 8px;
        }
        
        .security-badges {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }
        
        .security-badge {
            display: flex;
            align-items: center;
            font-size: 12px;
            color: #6c757d;
        }
        
        .security-badge i {
            margin-right: 5px;
            color: #28a745;
        }
        
        .support-text {
            text-align: center;
            margin-top: 20px;
            font-size: 13px;
            color: #6c757d;
        }
        
        .support-text a {
            color: #3a7bd5;
            text-decoration: none;
        }
        
        /* Floating Animation */
        .floating {
            animation: float 6s ease-in-out infinite;
        }
        
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }
        
        /* Pulse Animation for Pay Button */
        .pulse {
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(58, 123, 213, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(58, 123, 213, 0); }
            100% { box-shadow: 0 0 0 0 rgba(58, 123, 213, 0); }
        }
    </style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>
    
    <div class="payment-wrapper">
        <div class="payment-container">
            <div class="payment-header">
                <div class="header-icon floating">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h2>Secure Payment</h2>
                <p>Complete your transaction safely with Razorpay</p>
            </div>
            
            <div class="payment-body">
<!--                 Payment Information 
                <div class="payment-info">
                    <div class="payment-info-item">
                        <div class="payment-info-label">Amount</div>
                        <div class="payment-info-value">₹ 1,499</div>
                    </div>
                    <div class="payment-info-item">
                        <div class="payment-info-label">Service</div>
                        <div class="payment-info-value">Medical Consultation</div>
                    </div>
                    <div class="payment-info-item">
                        <div class="payment-info-label">Transaction ID</div>
                        <div class="payment-info-value">HMS-23791</div>
                    </div>
                </div>-->
                
                <!-- QR Code Section -->
                <div class="qr-section">
                    <img src="https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=https://razorpay.me/ahmed619" 
                         alt="QR Code Payment" class="qr-code">
                    <div class="qr-instruction">
                        <i class="fas fa-mobile-alt me-2"></i> Scan the QR code with your banking app
                    </div>
                </div>
                
                <!-- OR Divider -->
                <div class="or-divider">
                    <div class="or-divider::before"></div>
                    <span class="or-divider-text">or</span>
                    <div class="or-divider::after"></div>
                </div>
                
                <!-- Pay Button -->
                <a href="https://razorpay.me/@ahmed619" class="payment-btn pulse " target="_blank" style="background-color: blue">
                    <i class="fas fa-credit-card"></i> Pay Securely Now
                </a>
                
                <!-- Security Badges -->
                <div class="security-badges">
                    <div class="security-badge">
                        <i class="fas fa-lock"></i> SSL Encrypted
                    </div>
                    <div class="security-badge">
                        <i class="fas fa-shield-alt"></i> Secure Payment
                    </div>
                    <div class="security-badge">
                        <i class="fas fa-check-circle"></i> RBI Approved
                    </div>
                </div>
                
                <!-- Support Text -->
<!--                <div class="support-text">
                    Having trouble? <a href="#">Contact support</a>
                </div>
            </div>-->
        </div>
    </div>
    
    <!-- Additional scripts -->
    <script>
        // Add a visual feedback when clicking the pay button
        document.addEventListener('DOMContentLoaded', function() {
            const payButton = document.querySelector('.payment-btn');
            
            payButton.addEventListener('mousedown', function() {
                this.style.transform = 'scale(0.98)';
            });
            
            payButton.addEventListener('mouseup', function() {
                this.style.transform = 'scale(1)';
            });
            
            payButton.addEventListener('mouseleave', function() {
                this.style.transform = 'scale(1)';
            });
        });
    </script>
</body>
</html>