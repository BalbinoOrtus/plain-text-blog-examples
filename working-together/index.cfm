<cfscript>
  application.pepper = 'Crq7aX0yEORgx0OFhPUNIBHGDoOx95qcjqjhEFbyhiQ=';

  // generateHash
  function generateHash(
    required string password,
    string salt = GenerateSecretKey( 'AES' , '256' ),
    numeric iterations = randRange( 50000 , 100000 , 'SHA1PRNG' )
  ) {
    return arguments.iterations & ':' & arguments.salt & ':' 
            & GeneratePBKDFkey( 
              'PBKDF2WithHmacSHA1' , 
              arguments.password , 
              arguments.salt & application.pepper , 
              arguments.iterations 
            );
  }

  resultGenerateHash = generateHash("top_secret");

  // checkPassword
  function checkPassword(
    required string password,
    required string hash
  ) {
    var iterations = ListGetAt(arguments.hash, 1, ':');
    var salt = ListGetAt(arguments.hash, 2, ':');
    return ( generateHash ( arguments.password , salt , iterations ) EQ arguments.hash );
  }

  resultCheckPasswordFalse = checkPassword( "test", resultGenerateHash );
  resultCheckPasswordTrue = checkPassword( "top_secret", resultGenerateHash );

</cfscript>

<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
            rel="stylesheet" 
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
            crossorigin="anonymous">
        <title>Document</title>
    </head>
    <body>
        <div class="container">
            <h1>working together: </h1>
            <div>
              <a href="https://www.andrewdixon.co.uk/2020/05/12/password-hashing-in-cfml/">learn more</a>
            </div>
            <table class="table table-dark table-hover mt-4">
                <thead>
                  <tr>
                    <th scope="col">First</th>
                    <th scope="col">Last</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">generateHash</th>
                    <td>#resultGenerateHash#</td>
                  </tr>
                  <tr>
                    <th scope="row">checkPassword</th>
                    <td>is "test" correct? #resultCheckPasswordFalse#</td>
                  </tr>
                  <tr>
                    <th scope="row">checkPassword</th>
                    <td>is "top_secret" correct? #resultCheckPasswordTrue#</td>
                  </tr>
                </tbody>
              </table>
              <div>
                <a href="/index.cfm" class="btn btn-primary">back</a>
              </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
            crossorigin="anonymous"></script>
    </body>
    </html>

</cfoutput>
