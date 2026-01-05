<!DOCTYPE html>
<html>
<head>
    <title>Success | Job Posted</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

    <style>
        body { background-color: #f8fafc; font-family: 'Inter', sans-serif; }
        .success-card {
            max-width: 500px;
            margin: 100px auto;
            background: white;
            padding: 40px;
            border-radius: 24px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .checkmark-circle {
            width: 80px;
            height: 80px;
            background: #dcfce7;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: #16a34a;
            font-size: 40px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="success-card animate__animated animate__zoomIn">


        <!-- Logo section -->
                <div class="text-center mb-3">
                    <a class="navbar-brand" href="/">
                        <div class="d-flex align-items-center gap-2 justify-content-center">
                            <div style="background: linear-gradient(135deg, #6366f1, #a855f7);
                                        width: 40px; height: 40px; border-radius: 10px;
                                        display: flex; align-items: center; justify-content: center;">
                                <span style="color: white; font-weight: bold; font-size: 20px;">J</span>
                            </div>
                            <span style="font-family: 'Inter', sans-serif; font-weight: 700;
                                         font-size: 24px; color: #1e293b; letter-spacing: -1px;">
                                Job<span style="color: #6366f1;">Flow</span>
                            </span>
                        </div>
                    </a>
                </div>

            <h2 class="fw-bold text-dark mb-2">Job Posted Successfully!</h2>
            <p class="text-muted mb-4">Your job listing is now live and visible to thousands of applicants.</p>



            <div class="d-grid gap-2">
                <a href="/" class="btn btn-primary btn-lg" style="background: #6366f1; border: none; border-radius: 12px;">View All Jobs</a>
                <a href="/create-job" class="btn btn-link text-decoration-none text-muted">Post another one</a>
            </div>
        </div>
    </div>

</body>
</html>