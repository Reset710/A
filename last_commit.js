const https = require('https');

const options = {
    hostname: 'api.github.com',
    path: '/repos/Reset710/A/commits?per_page=1',
    headers: {
        'User-Agent': 'request'
    }
};

const req = https.get(options, (res) => {
    let data = '';

    res.on('data', (chunk) => {
        data += chunk;
    });

    res.on('end', () => {
        const commits = JSON.parse(data);
        const lastCommitTimestamp = commits[0].commit.author.date;
        console.log(lastCommitTimestamp);
        // You can save or process lastCommitTimestamp as needed
    });
});

req.on('error', (error) => {
    console.error(error);
});

req.end();
