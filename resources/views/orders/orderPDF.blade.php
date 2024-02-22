<!DOCTYPE html>
<html>
<head>
    <title>Report</title>
</head>
<body>
    <h1>Report</h1>
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Detail</th>
                <!-- Add more columns as needed -->
            </tr>
        </thead>
        <tbody>
            {{-- @foreach ($reports as $report) --}}
                <tr>
                    <td>{{ '$report->id' }}</td>
                    <td>{{ '$report->detail' }}</td>
                </tr>
            {{-- @endforeach --}}
        </tbody>
    </table>
</body>
</html>