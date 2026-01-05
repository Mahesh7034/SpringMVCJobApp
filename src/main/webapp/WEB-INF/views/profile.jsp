<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body class="bg-light">

    <nav class="navbar bg-white border-bottom mb-4">
        <div class="container">
            <a class="navbar-brand fw-bold" href="/">JobFlow</a>
            <a href="/" class="btn btn-outline-secondary btn-sm"><i class="bi bi-arrow-left"></i> Back to Jobs</a>
        </div>
    </nav>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7">

                <c:if test="${param.success != null}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="bi bi-check-circle-fill me-2"></i> Profile updated successfully!
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <div class="card shadow-sm border-0 rounded-3">
                    <div class="card-header bg-white p-4 d-flex justify-content-between align-items-center">
                        <h4 class="mb-0 fw-bold text-primary">My Details</h4>
                        <button id="editBtn" onclick="enableEditing()" class="btn btn-outline-primary btn-sm">
                            <i class="bi bi-pencil-square"></i> Edit Details
                        </button>
                    </div>

                    <div class="card-body p-4">
                        <form action="/update-profile" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                            <input type="hidden" name="userId" value="${profile.userId}">

                            <fieldset id="formFields" disabled>
                                <div class="mb-3">
                                    <label class="form-label text-muted small fw-bold">Full Name</label>
                                    <input type="text" name="fullName" value="${profile.fullName}" class="form-control" placeholder="Not set">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-muted small fw-bold">Email Address</label>
                                    <input type="email" name="email" value="${profile.email}" class="form-control" placeholder="Not set">
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label text-muted small fw-bold">City</label>
                                        <input type="text" name="city" value="${profile.city}" class="form-control" placeholder="e.g. New York">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label text-muted small fw-bold">Skills</label>
                                        <input type="text" name="skills" value="${profile.skills}" class="form-control" placeholder="e.g. Java, SQL">
                                    </div>
                                </div>
                            </fieldset>

                            <div id="actionButtons" class="d-none mt-4">
                                <div class="d-flex gap-2">
                                    <button type="submit" class="btn btn-primary flex-grow-1">Save Changes</button>
                                    <a href="/profile" class="btn btn-light border">Cancel</a>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function enableEditing() {
            // 1. Enable all fields
            document.getElementById('formFields').disabled = false;

            // 2. Hide the "Edit" button
            document.getElementById('editBtn').style.display = 'none';

            // 3. Show the Save/Cancel buttons
            document.getElementById('actionButtons').classList.remove('d-none');
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

























