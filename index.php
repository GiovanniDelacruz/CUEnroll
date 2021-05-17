<?php
include '/../inc/header.php';

Session::CheckSession();

echo session_id();

$_SESSION['page_count'] = $_SESSION['page_count'] ?? 0;
$_SESSION['page_count']++;

if ($_SESSION['page_count'] > 10){
    echo "Thank you for visiting our website 10 times";
    session_unset();
    session_destroy();
}

$logMsg = Session::get('logMsg');
if (isset($logMsg)) {
  echo $logMsg;
}
$msg = Session::get('msg');
if (isset($msg)) {
  echo $msg;
}
Session::set("msg", NULL);
Session::set("logMsg", NULL);
?>
<?php

if (isset($_GET['remove'])) {
  $remove = preg_replace('/[^a-zA-Z0-9-]/', '', (int)$_GET['remove']);
  $removeUser = $users->deleteUserById($remove);
}

if (isset($removeUser)) {
  echo $removeUser;
}
if (isset($_GET['deactive'])) {
  $deactive = preg_replace('/[^a-zA-Z0-9-]/', '', (int)$_GET['deactive']);
  $deactiveId = $users->userDeactiveByAdmin($deactive);
}

if (isset($deactiveId)) {
  echo $deactiveId;
}
if (isset($_GET['active'])) {
  $active = preg_replace('/[^a-zA-Z0-9-]/', '', (int)$_GET['active']);
  $activeId = $users->userActiveByAdmin($active);
}

if (isset($activeId)) {
  echo $activeId;
}


 ?>
      <div class="card ">
        <div class="card-header">
          <h3><i class="fas fa-users mr-2"></i>User list <span class="float-right">Welcome! <strong>
            <span class="badge badge-lg badge-secondary text-white">
<?php
$firstname = Session::get('firstname');
if (isset($firstname)) {
  echo $firstname;
}
 ?></span>

          </strong></span></h3>
        </div>
    <h1>My Awesome page visited: <?php echo $_SESSION['page_count'] ?? 0 ?></h1>
    

<div class="card-body pr-2 pl-2">

          
 <?php if ( Session::get("roleid") == '5') {?>
<table id="example" class="table table-striped table-bordered" style="width:100%">
                  <thead>
                    <tr>
                      <th  class="text-center">SL</th>
                      <th  class="text-center">First Name</th>
                      <th  class="text-center">Last name</th>
                      <th  class="text-center">Email address</th>
                      <th  class="text-center">Mobile</th>
                      <th  class="text-center">Status</th>
                      <th  width='25%' class="text-center">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                               
<?php
		$allUser = $users->selectAllUserData();
					  
		 
                      if ($allUser) {
                        $i = 0;
                        foreach ($allUser as  $value) {
                          			$i++;
	?>		
                     

                      <tr class="text-center"
                      <?php if (Session::get("id") == $value->id) {
                        echo "style='background:#d9edf7' ";
                      } ?>
                      >

                        <td><?php echo $i; ?></td>
                        <td><?php echo $value->firstname; ?></td>
                        <td><?php echo $value-> lastname; ?> <br>
                          <?php if ($value->roleid  == '5'){
                          echo "<span class='badge badge-lg badge-info text-white'>Admin</span>";
                        } elseif ($value->roleid == '4') {
                          echo "<span class='badge badge-lg badge-dark text-white'>Secretary</span>";
			} elseif ($value->roleid == '3') {
                          echo "<span class='badge badge-lg badge-dark text-white'>Chair</span>";
			} elseif ($value->roleid == '2') {
                          echo "<span class='badge badge-lg badge-dark text-white'>Faculty</span>";

                        }elseif ($value->roleid == '1') {
                            echo "<span class='badge badge-lg badge-dark text-white'>Student</span>";
                        } ?></td>
                        <td><?php echo $value->email; ?></td>

                        <td><span class="badge badge-lg badge-secondary text-white"><?php echo $value->mobile; ?></span></td>
                        <td>
                          <?php if ($value->isActive == '0') { ?>
                          <span class="badge badge-lg badge-info text-white">Active</span>
                        <?php }else{ ?>
                    <span class="badge badge-lg badge-danger text-white">Deactive</span>
                        <?php } ?>

                        </td>
                                                <td>
                          <?php if ( Session::get("roleid") == '5') {?>
                            <a class="btn btn-success btn-sm
                            " href="profile.php?id=<?php echo $value->id;?>">View</a>
                            <a class="btn btn-info btn-sm " href="profile.php?id=<?php echo $value->id;?>">Edit</a>
                            <a onclick="return confirm('Are you sure To Delete ?')" class="btn btn-danger
                    <?php if (Session::get("id") == $value->id) {
                      echo "disabled";
                    } ?>
                             btn-sm " href="?remove=<?php echo $value->id;?>">Remove</a>

                             <?php if ($value->isActive == '0') {  ?>
                               <a onclick="return confirm('Are you sure To Deactive ?')" class="btn btn-warning
                       <?php if (Session::get("id") == $value->id) {
                         echo "disabled";
                       } ?>
                                btn-sm " href="?deactive=<?php echo $value->id;?>">Disable</a>
                             <?php } elseif($value->isActive == '1'){?>
                               <a onclick="return confirm('Are you sure To Active ?')" class="btn btn-secondary
                       <?php if (Session::get("id") == $value->id) {
                         echo "disabled";
                       } ?>
                                btn-sm " href="?active=<?php echo $value->id;?>">Active</a>
                             <?php } ?>




                        <?php  }elseif(Session::get("id") == $value->id  && Session::get("roleid") == '2'||'3'||'4' ){ ?>
                          <a class="btn btn-success btn-sm " href="profile.php?id=<?php echo $value->id;?>">View</a>
                          <a class="btn btn-info btn-sm " href="profile.php?id=<?php echo $value->id;?>">Edit</a>
                        <?php  }elseif( Session::get("roleid") == '2'){ ?>
                          <a class="btn btn-success btn-sm
                          <?php if ($value->roleid == '1') {
                            echo "disabled";
                          } ?>
                          " href="profile.php?id=<?php echo $value->id;?>">View</a>
                          <a class="btn btn-info btn-sm
                          <?php if ($value->roleid == '1') {
                            echo "disabled";
                          } ?>
                          " href="profile.php?id=<?php echo $value->id;?>">Edit</a>
                        <?php }elseif(Session::get("id") == $value->id  && Session::get("roleid") == '1'){ ?>
                          <a class="btn btn-success btn-sm " href="profile.php?id=<?php echo $value->id;?>">View</a>
                          <a class="btn btn-info btn-sm " href="profile.php?id=<?php echo $value->id;?>">Edit</a>
                        <?php }else{ ?>
                          <a class="btn btn-success btn-sm
                          <?php if ($value->roleid == '1') {
                            echo "disabled";
                          } ?>
                          " href="profile.php?id=<?php echo $value->id;?>">View</a>
<?php } ?>


                        </td>
                      </tr>


                    <?php }}else {?>
                    
  <tr class="text-center">
			
                   <td><?php echo Session::get("id"); ?></td>
			<td><?php echo Session::get("firstname"); ?></td>
                        <td><?php echo Session::get("lastname"); ?> <br>
                          <?php if (Session::get("roleid")  == '5'){
                          echo "<span class='badge badge-lg badge-info text-white'>Admin</span>";
                        } elseif (Session::get("roleid") == '4') {
                          echo "<span class='badge badge-lg badge-dark text-white'>Secretary</span>";
			} elseif (Session::get("roleid") == '3') {
                          echo "<span class='badge badge-lg badge-dark text-white'>Chair</span>";
			} elseif (Session::get("roleid") == '2') {
                          echo "<span class='badge badge-lg badge-dark text-white'>Faculty</span>";

                        }elseif (Session::get("roleid") == '1') {
                            echo "<span class='badge badge-lg badge-dark text-white'>Student</span>";
                        } ?></td>
                        <td><?php echo Session::get("email"); ?></td>

                        <td><span class="badge badge-lg badge-secondary text-white"><?php echo Session::get("mobile"); ?></span></td>
                        <td>
                          <?php if (Session::get("isActive") == '0') { ?>
                          <span class="badge badge-lg badge-info text-white">Active</span>
                        <?php }else{ ?>
                    <span class="badge badge-lg badge-danger text-white">Deactive</span>
                         <?php } ?>

                        </td>

			</tr>
                  <?php } ?>






		 </tbody>

              </table>











        </div>
      </div>



  <?php
  include 'inc/footer.php';

  }?>
