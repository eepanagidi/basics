const http = require('http');

// This port should match what's in your index.js or the environment variable you set.
const port = process.env.PORT || 3000;

http.get(`http://localhost:${port}`, (res) => {
    let data = '';

    res.on('data', (chunk) => {
        data += chunk;
    });

    res.on('end', () => {
        if (data.trim() === 'Hello Node!') {
            console.log('Test passed successfully!');
            process.exit(0);
        } else {
            console.error('Test failed: Expected "Hello Node!" but received', data);
            process.exit(1);
        }
    });

}).on('error', (err) => {
    console.error('Test failed:', err);
    process.exit(1);
});
