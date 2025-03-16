PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
  then
    echo "Please provide an element as an argument."
    exit 
  else
    ELEMENT_INPUT=$1 
fi

if [[ "$ELEMENT_INPUT" =~ ^[0-9]+$ ]]
  then 
  ELEMENT_NUMBER=$($PSQL "select atomic_number from elements where atomic_number=$ELEMENT_INPUT")
  ELEMENT_NAME=$($PSQL "select name from elements where atomic_number=$ELEMENT_INPUT")
  ELEMENT_SYMBOL=$($PSQL "select symbol from elements where atomic_number=$ELEMENT_INPUT")
  ELEMENT_TYPE=$($PSQL "select type from types inner join properties on types.type_id=properties.type_id where properties.atomic_number=$ELEMENT_NUMBER")
  ELEMENT_MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ELEMENT_NUMBER")
  ELEMENT_MP=$($PSQL "select melting_point_celsius from properties where atomic_number=$ELEMENT_NUMBER")
  ELEMENT_BC=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ELEMENT_NUMBER")
  

  if [[ -z $ELEMENT_NUMBER ]]
    then echo "I could not find that element in the database."
  else
    echo "The element with atomic number $ELEMENT_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MP celsius and a boiling point of $ELEMENT_BC celsius."
  fi

  else
  ELEMENT_NUMBER=$($PSQL "select atomic_number from elements where name='$ELEMENT_INPUT' or symbol='$ELEMENT_INPUT'")
  ELEMENT_NAME=$($PSQL "select name from elements where name='$ELEMENT_INPUT' or symbol='$ELEMENT_INPUT'")
  ELEMENT_SYMBOL=$($PSQL "select symbol from elements where name='$ELEMENT_INPUT' or symbol='$ELEMENT_INPUT'") 
  ELEMENT_TYPE=$($PSQL "select type from types inner join properties on types.type_id=properties.type_id where properties.atomic_number=$ELEMENT_NUMBER")
  ELEMENT_MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ELEMENT_NUMBER")
  ELEMENT_MP=$($PSQL "select melting_point_celsius from properties where atomic_number=$ELEMENT_NUMBER")
  ELEMENT_BC=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ELEMENT_NUMBER")
  
  if [[ -z $ELEMENT_NUMBER ]]
    then echo "I could not find that element in the database."
  else
    echo "The element with atomic number $ELEMENT_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MP celsius and a boiling point of $ELEMENT_BC celsius."
  fi
fi 





