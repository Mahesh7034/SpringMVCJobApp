<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Post a Job</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-lg border-0">
                    <div class="card-header bg-primary text-white p-4">
                        <h3 class="mb-0">Post a New Opportunity</h3>
                    </div>
                    <div class="card-body p-5">

                        <form action="/save-job" method="POST">

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Job Title</label>
                                    <input type="text" name="title" class="form-control" placeholder="e.g. Java Developer" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Company Name</label>
                                    <input type="text" name="companyName" class="form-control" placeholder="e.g. Tech Corp" required>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Location</label>
                                    <input type="text" name="location" class="form-control" placeholder="e.g. Remote / London">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Job Type</label>
                                    <select name="jobType" class="form-select">
                                        <option value="Full-time">Full-time</option>
                                        <option value="Part-time">Part-time</option>
                                        <option value="Contract">Contract</option>
                                        <option value="Remote">Remote</option>
                                    </select>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Salary Range</label>
                                <input type="text" name="salaryRange" class="form-control" placeholder="e.g. $80k - $100k">
                            </div>

                            <div class="mb-4">
                                <label class="form-label fw-bold">Job Description</label>
                                <textarea name="description" class="form-control" rows="5" placeholder="Enter job responsibilities..." required></textarea>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary btn-lg">Publish Job</button>
                                <a href="/" class="btn btn-outline-secondary">Cancel</a>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>