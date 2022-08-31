<cfscript>
  // Generate an AES 128 bit Key
  ex={};
  ex.key = generateSecretKey("AES");
  ex.secret = "top secret";
  ex.encrypted=encrypt(ex.secret, ex.key, "AES", "Base64");
  ex.decrypted=decrypt(ex.encrypted, ex.key, "AES", "Base64");
  // writeDump(ex);

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
            <h1>generateSecretKey method:</h1>
            <div>
              <a href="https://cfdocs.org/generatesecretkey">learn more</a>
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
                    <th scope="row">Generate an AES 128 bit Key</th>
                    <td>#ex.encrypted#</td>
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
