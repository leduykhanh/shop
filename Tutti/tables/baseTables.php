<?php
foreach (glob(dirname(dirname(__FILE__))."/objects/*.php") as $filename)
{
	if(file_exists($filename)) 
	require_once($filename);

	else echo "<br />".$filename;
}
require_once dirname(dirname(__FILE__))."/dbconnect.php";
//echo 1;
$Tables = new ObjectsArray();

///////////////
//area to add object
$t_product = new Product();
$Tables->addObject($t_product);

$t_category = new Category();
$Tables->addObject($t_category);

$t_comment = new Comment();
$Tables->addObject($t_comment);
//end area
$Tables->genrateTables();
echo "---- Add Foreign keys ----";
$Tables->addForeignKey();

class ObjectsArray
{
	private $numObjects;
	private $arrayObjects;
	private $arrayObjectNames;

	public function __construct(){
		$this->numObjects = 0;
		$this->arrayObjects = array();
		$this->arrayObjectNames = array();

		}

	public function addObject($t_object){
		$object = get_object_vars($t_object);
		$this->arrayObjects[$this->numObjects] = $object;
		$this->arrayObjectNames[$this->numObjects] = get_class($t_object);
		$this->numObjects = $this->numObjects +1;
		}
	public function genrateTables(){
		$queryString = "CREATE TABLE IF NOT EXISTS User <br />
						(id int(10) NOT NULL AUTO_INCREMENT,<br />
						username VARCHAR(50) NOT NULL, <br />
						password VARCHAR(50) NOT NULL, <br />
						name VARCHAR(50) NULL, <br />
						address VARCHAR(50) NULL, <br />
						number int(10) NULL, <br />
						email VARCHAR(50) NULL, <br />
						creation_dt datetime NULL, <br />
						PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ; <br />";
		$queryString = $queryString." <br />CREATE TABLE IF NOT EXISTS Role <br />
						(id int(10) NOT NULL AUTO_INCREMENT,<br />
						role_id int(10) NULL, <br />
						creation_dt datetime NULL, <br />
						role_name VARCHAR(50) NULL, <br />
						PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ; <br />";
		$queryString = $queryString."  <br />CREATE TABLE IF NOT EXISTS User_Role <br />
						(id int(10) NOT NULL AUTO_INCREMENT,<br />
						user_id int(10) NULL, <br />
						role_id int(10) NULL, <br />
						creation_dt datetime NULL, <br />
						PRIMARY KEY (id), <br />
						FOREIGN KEY (user_id) REFERENCES User(id) <br />
						ON UPDATE CASCADE ON DELETE RESTRICT, <br />
						FOREIGN KEY (role_id) REFERENCES Role(id) <br />
						ON UPDATE CASCADE ON DELETE RESTRICT <br />
						) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ; <br />";
		for($i=0;$i<$this->numObjects;$i++){
			$table_name = $this->arrayObjectNames[$i];
			$attributes = $this->arrayObjects[$i];
			//var_dump($attributes);
			$queryString = $queryString."</br>CREATE TABLE IF NOT EXISTS ".$table_name."</br>(id int(10) NOT NULL AUTO_INCREMENT";
			
			while($attribute = current($attributes)){
				//var_dump($attribute);
				if (key($attributes)!="fk_list")
					$queryString = $queryString.",</br>".key($attributes)." ".$this->getDatabaseType(gettype($attribute))." NULL";
				next($attributes);
				}
			$queryString = $queryString.",
			</br> creation_dt datetime NULL,
			</br> PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;</br>";
			}
		echo $queryString;

		//mysql_query($queryString) or die(mysql_error());
		//var_dump($this->arrayObjects);
		}
// add foreign key
	public function addForeignKey(){
		$queryString = "";
		for($i=0;$i<$this->numObjects;$i++){
			$table_name = $this->arrayObjectNames[$i];
			$attributes = $this->arrayObjects[$i];
			$fk_array = array();
			if(isset($attributes["fk_list"]))
			if($attributes["fk_list"]!=null){
					$fk_array = $attributes["fk_list"];
					$queryString = $queryString."</br>ALTER TABLE ".$table_name."</br>";
					while($fk = current($fk_array)){
						$queryString = $queryString." <br />ADD CONSTRAINT ";
						$col1 = key($fk_array); 
						$col2 = substr($fk,strrpos($fk,"(") + 1,strrpos($fk,")") - strrpos($fk,"(") - 1);
						$class = substr($fk,0,strrpos($fk,"("));
						$queryString = $queryString.$table_name."_".$class." FOREIGN KEY (".$col1.") REFERENCES ".$class."(".$col2.")";
						$queryString = $queryString."</br> ON UPDATE CASCADE ON DELETE RESTRICT</br>";
						next($fk_array);
						}
					
					}
			}
		echo $queryString;
		//mysql_query($queryString) or die(mysql_error());
		//var_dump($this->arrayObjects);
		}
// to convert to database type

	public function getDatabaseType($type){
		
		switch($type){
			case "string":
				return "VARCHAR(50)";
			case "integer":
				return "int(10)";
			default : 
				return $type;
		}
	}
}

?>