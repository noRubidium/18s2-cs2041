#!/bin/sh

EMAIL_SUFFIX="cse.unsw.edu.au"
<<EOF
User Name : z5041652            Aliases : mshen
      Uid : 31630                   Gid : 31630
  Expires : 17mar2019

   Groups : cs1521[16dec2018], cs2041ass[16dec2018]
          : cs2041cgi[16dec2018], cs2041[16dec2018]
Group classes :
User classes : 3707_Student, COMP1521_Tutor[16dec2018]
          : COMP2041_Tutor[16dec2018], COMP4931_Student[17feb2019]
          : SENG4920_Student[16dec2018]
Misc classes :

     Name : Mr Shen, Minjie (Minjie Shen)
 Position : Casual Academic (Computer Science & Engineering)
UNSW Number : 5041652
UNSW Mail : minjie.shen@unsw.edu.au
UNSW Home : //INFPWFS219.ad.unsw.edu.au/Student037$/z5041652
 CSE Home : /import/adams/2/z5041652
CSE Password : !!{CRYPT}$1$$x
EOF
process_content () {
  name=`acc "z$student" | egrep "Name :" | egrep -o "\(.*\)"`
  echo "Hi $name,";
  echo "";
  echo "The following is the feedback for your week 5 lab exercise.";
  echo "It is important to take a look and make sure you understand the reason why I gave you those feedback, as I will follow somewhat similar style guide during the assignment marking to assess the readability and maintainability of your code."
  echo "$content";
  echo "";
  echo "Cheers,";
  echo "Minjie";
}

email () {
  local student="$1";
  local content="$2";
  content=`process_content "$student" "$content"`;
  email="$student${EMAIL_SUFFIX}";
  # mutt -e "set content_type=text/html" Email address -s "subject" < test.html
  echo "emailing to $email: \n$content";
}

process_chunk () {
  local prev_student="$1";
  local prev_content="$2";
  if read line; then
    if echo  "$line" | egrep -q '^[0-9]{7}:$'; then
      # looking at student number line
      test -z "${prev_student}" || email "${prev_student}" "${prev_content}";
      # update student
      process_chunk "`echo "$line" | egrep -o '[0-9]{7}'`" "";
    else
      # looking at a comment
      process_chunk "${prev_student}" "${prev_content}\n${line}";
    fi
  fi
}

process_chunk;
