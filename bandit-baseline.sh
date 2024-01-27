cat > baseline.json<<EOF
{
  "results": [
    {
      "code": "13     hashsed_password = hashlib.md5(password.encode()).hexdigest()\n14     cur.execute(f\"SELECT * FROM users WHERE email=%s AND password=%s\", [username, hashsed_password ])\n15     user = cur.fetchone()\n",
      "col_offset": 16,
      "filename": "./flaskblog/auth.py",
      "issue_confidence": "MEDIUM",
      "issue_cwe": {
        "id": 89,
        "link": "https://cwe.mitre.org/data/definitions/89.html"
      },
      "issue_severity": "MEDIUM",
      "issue_text": "Possible SQL injection vector through string-based query construction.",
      "line_number": 14,
      "line_range": [
        14
      ],
      "more_info": "https://bandit.readthedocs.io/en/1.7.4/plugins/b608_hardcoded_sql_expressions.html",
      "test_id": "B608",
      "test_name": "hardcoded_sql_expressions"
    },
    {
      "code": "132         cur.execute(\n133             f\"INSERT INTO posts (`body`, `slug`, `author`, `title`) VALUES (%s, %s, %s, %s)\",\n134             [body, slug, claim.get(\"id\"), title])\n",
      "col_offset": 12,
      "filename": "./flaskblog/blogapi/dashboard.py",
      "issue_confidence": "MEDIUM",
      "issue_cwe": {
        "id": 89,
        "link": "https://cwe.mitre.org/data/definitions/89.html"
      },
      "issue_severity": "MEDIUM",
      "issue_text": "Possible SQL injection vector through string-based query construction.",
      "line_number": 133,
      "line_range": [
        133
      ],
      "more_info": "https://bandit.readthedocs.io/en/1.7.4/plugins/b608_hardcoded_sql_expressions.html",
      "test_id": "B608",
      "test_name": "hardcoded_sql_expressions"
    },
    {
      "code": "99         cur = db.connection.cursor()\n100         cur.execute(f\"UPDATE `users` SET `email` = '{email}', `full_name` = '{full_name}', `phone_number` = '{phone_number}', `dob` = '{dob}' WHERE `users`.`id` = {request.args.get('uid')}\")\n101         db.connection.commit()\n",
      "col_offset": 20,
      "filename": "./flaskblog/blogapi/dashboard.py",
      "issue_confidence": "MEDIUM",
      "issue_cwe": {
        "id": 89,
        "link": "https://cwe.mitre.org/data/definitions/89.html"
      },
      "issue_severity": "MEDIUM",
      "issue_text": "Possible SQL injection vector through string-based query construction.",
      "line_number": 100,
      "line_range": [
        100
      ],
      "more_info": "https://bandit.readthedocs.io/en/1.7.4/plugins/b608_hardcoded_sql_expressions.html",
      "test_id": "B608",
      "test_name": "hardcoded_sql_expressions"
    },
    {
      "code": "84         cur = db.connection.cursor()\n85         cur.execute(f\"SELECT * FROM users WHERE id=%s\", [request.args.get('uid')])\n86         user = cur.fetchone()\n",
      "col_offset": 20,
      "filename": "./flaskblog/blogapi/dashboard.py",
      "issue_confidence": "MEDIUM",
      "issue_cwe": {
        "id": 89,
        "link": "https://cwe.mitre.org/data/definitions/89.html"
      },
      "issue_severity": "MEDIUM",
      "issue_text": "Possible SQL injection vector through string-based query construction.",
      "line_number": 85,
      "line_range": [
        85
      ],
      "more_info": "https://bandit.readthedocs.io/en/1.7.4/plugins/b608_hardcoded_sql_expressions.html",
      "test_id": "B608",
      "test_name": "hardcoded_sql_expressions"
    },
    {
      "code": "13     hashsed_password = hashlib.md5(password.encode()).hexdigest()\n14     cur.execute(f\"SELECT * FROM users WHERE email=%s AND password=%s\", [username, hashsed_password ])\n15     user = cur.fetchone()\n",
      "col_offset": 16,
      "filename": "./flaskblog/auth.py",
      "issue_confidence": "MEDIUM",
      "issue_cwe": {
        "id": 89,
        "link": "https://cwe.mitre.org/data/definitions/89.html"
      },
      "issue_severity": "MEDIUM",
      "issue_text": "Possible SQL injection vector through string-based query construction.",
      "line_number": 14,
      "line_range": [
        14
      ],
      "more_info": "https://bandit.readthedocs.io/en/1.7.4/plugins/b608_hardcoded_sql_expressions.html",
      "test_id": "B608",
      "test_name": "hardcoded_sql_expressions"
    },
    {
      "code": "25         cur = db.connection.cursor()\n26         cur.execute(f\"SELECT * FROM posts WHERE slug='{slug}'\")\n27         post = cur.fetchone()\n",
      "col_offset": 20,
      "filename": "./flaskblog/blogapi/home.py",
      "issue_confidence": "MEDIUM",
      "issue_cwe": {
        "id": 89,
        "link": "https://cwe.mitre.org/data/definitions/89.html"
      },
      "issue_severity": "MEDIUM",
      "issue_text": "Possible SQL injection vector through string-based query construction.",
      "line_number": 26,
      "line_range": [
        26
      ],
      "more_info": "https://bandit.readthedocs.io/en/1.7.4/plugins/b608_hardcoded_sql_expressions.html",
      "test_id": "B608",
      "test_name": "hardcoded_sql_expressions"
    },
    {
      "code": "48         cur = db.connection.cursor()\n49         cur.execute(f\"SELECT * FROM posts WHERE title LIKE '%{query}%'\")\n50         search_posts = cur.fetchall() #Post.objects(title__icontains=query)\n",
      "col_offset": 20,
      "filename": "./flaskblog/blogapi/home.py",
      "issue_confidence": "MEDIUM",
      "issue_cwe": {
        "id": 89,
        "link": "https://cwe.mitre.org/data/definitions/89.html"
      },
      "issue_severity": "MEDIUM",
      "issue_text": "Possible SQL injection vector through string-based query construction.",
      "line_number": 49,
      "line_range": [
        49
      ],
      "more_info": "https://bandit.readthedocs.io/en/1.7.4/plugins/b608_hardcoded_sql_expressions.html",
      "test_id": "B608",
      "test_name": "hardcoded_sql_expressions"
    },
    {
      "code": "73         cur.execute(\n74             f\"INSERT INTO users (`email`, `full_name`, `password`) VALUES ('{email}', '{full_name}', '{hashed_password}')\")\n75         db.connection.commit()\n",
      "col_offset": 12,
      "filename": "./flaskblog/blogapi/user.py",
      "issue_confidence": "MEDIUM",
      "issue_cwe": {
        "id": 89,
        "link": "https://cwe.mitre.org/data/definitions/89.html"
      },
      "issue_severity": "MEDIUM",
      "issue_text": "Possible SQL injection vector through string-based query construction.",
      "line_number": 74,
      "line_range": [
        74
      ],
      "more_info": "https://bandit.readthedocs.io/en/1.7.4/plugins/b608_hardcoded_sql_expressions.html",
      "test_id": "B608",
      "test_name": "hardcoded_sql_expressions"
    }   
  ]
}
EOF

bandit -r . -f json | jq '.results | length'

bandit -r . -f json -b baseline.json | jq '.results | length'
Check the result once again.
