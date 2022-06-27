<?php
require 'config.php';

//additional php code for this page goes here
//what I added 
$pdo = pdo_connect_mysql();

$msg = "";

// check to see if the form has been submitted or check if POST data is not empty
if(!empty($_POST)){
    // check to see if the data from the form is set
    $name = isset($_POST['name']) ? $_POST['name'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $phone = isset($_POST['phone']) ? $_POST['phone'] : '';
    $title = isset($_POST['title']) ? $_POST['title'] : '';
    $created = isset($_POST['created']) ? $_POST['created'] : date('Y-m-d H:i:s');

    // insert the contact record into the contacts table
    $stmt = $pdo->prepare("INSERT INTO contacts VALUES (NULL, ?, ?, ?, ?, ?)");
    $stmt->execute([$name, $email, $phone, $title, $created]); 

    $msg = 'New contact created successfully.';
    // header('Location: contacts.php');
    $feedback->set_feedback($msg, 'contacts'); 

}


//end of my code 

?>

<?= template_header('Page Title') ?>
<?= template_nav('Site Title') ?>

<!-- START PAGE CONTENT -->
<h1 class="title">Page Heading</h1>

<form action="" method="post">
<form action="" method="post">
    <div class="field">
        <label class="label">Name</label>
        <div class="control has-icons-left">
            <input class="input" type="text" name="name" placeholder="Bob Smith" require>
            <span class="icon is-left">
                <i class="fas fa-user"></i>
            </span>
        </div>    
    </div>
    <div class="field">
        <label class="label">Email</label>
        <div class="control has-icons-left">
            <input class="input" type="email" name="email" placeholder="bsmith@gmail.com" require>
            <span class="icon is-left">
                <i class="fas fa-at"></i>
            </span>
        </div>    
    </div>   
    <div class="field">
        <label class="label">Phone</label>
        <div class="control has-icons-left">
            <input class="input" type="phone" name="phone" placeholder="222-555-1212" require>
            <span class="icon is-left">
                <i class="fas fa-phone"></i>
            </span>
        </div>    
    </div> 
    <div class="field">
        <label class="label">Title</label>
        <div class="control has-icons-left">
            <input class="input" type="text" name="title" placeholder="Ninja" require>
            <span class="icon is-left">
                <i class="fas fa-user-ninja"></i>
            </span>
        </div>    
    </div>   
    <div class="field">
        <p class="control">
            <button class="button is-success">
                Update
            </button>
        </p>
    </div>
</from>

    <!-- END PAGE CONTENT -->

<?= template_footer() ?>
