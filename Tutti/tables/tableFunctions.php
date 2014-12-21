<?php
require_once dirname(dirname(__FILE__))."/dbconnect.php";
//echo 1;
 function insert_object($t_object){
		$table_name = get_class($t_object);
		$query_string = "";
		$insert_string ="INSERT INTO ".$table_name."(";
		$values_string = " VALUES (";
		while($element = current($t_object))
		{
			$insert_string = $insert_string.key($t_object).",";
			if(gettype($element)=="string")
				$values_string = $values_string."'".$element."',";
			else $values_string = $values_string.$element.",";
			next($t_object);
		}
		$insert_string = $insert_string."creation_dt)";
		$values_string = $values_string."now() )";
		$query_string = $insert_string.$values_string;
		mysql_query($query_string) or die(mysql_error());
	}
// update 
 function update_object($t_object,$id){
		$table_name = get_class($t_object);
		$query_string = "UPDATE ".$table_name." SET ";
		while($element = current($t_object))
		{
			if(gettype($element)=="string")
				$query_string = $query_string.key($t_object)." = '".$element."',";
			else $query_string = $query_string.key($t_object)." = ".$element.",";
			next($t_object);
		} 
		$query_string = $query_string."creation_dt = now() WHERE id = ".$id;
		mysql_query($query_string) or die(mysql_error());
		//echo $query_string;
	}
 function delete_object($t_object,$id){
		$table_name = get_class($t_object);
		$query_string = "DELETE FROM ".$table_name." WHERE id = ".$id;
		mysql_query($query_string) or die(mysql_error());
		//echo $query_string;
	}
?>