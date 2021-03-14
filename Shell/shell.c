#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdbool.h>

#define BUFFER_LEN 1024

size_t read_command(char *cmd)
{
    if (!fgets(cmd, BUFFER_LEN, stdin)) 
        return 0;                       
    size_t length = strlen(cmd);        
    if (cmd[length - 1] == '\n')
        cmd[length - 1] = '\0'; 
    return strlen(cmd);        
}
int build_args(char *cmd, char **argv)
{
    char *token; 
    token = strtok(cmd, " ");
    int i = 0;
    while (token != NULL)
    {                            
        argv[i] = token;           
        token = strtok(NULL, " "); 
        i++;                       
    }
    argv[i] = NULL;  
    return i;
}
void set_program_path(char *path, char *bin, char *prog)
{
    memset(path, 0, 1024);                 
    strcpy(path, bin);                    
    strcat(path, prog); 
    int i ;              
    for (i = 0; i < strlen(path); i++) 
        if (path[i] == '\n')
            path[i] = '\0';
}

void change_dir(char *command, char *folder)
{

    char s[100];
    if (strcmp(folder, "~") == 0)
        chdir(getenv("HOME"));
    else if (chdir(folder) != 0)
        perror("chdir() to /error failed");

    printf("current Path:%s\n", getcwd(s, 100));


}
bool check_for_redirection(char **argv)
{
    int i = 0;
    while (argv[i] != NULL)
    {

        if (strcmp(argv[i], ">") == 0)
        {
            return true;
        }
        i++;
    }
    return false;
}
void deleteUtil(char **argv, int pos)
{

    while (argv[pos] != NULL)
    {

        int j = pos;

        while (argv[j] != NULL)
        {
            argv[j] = argv[j + 1];
            j++;
        }
    }
}
char *getfile(char **argv)
{
    char *text;
    int x = -1;
    bool flag = 0;
    int i = 0;
    while (argv[i] != NULL)
    {

        if (strcmp(argv[i], ">") == 0)
        {
            x = i + 1;
            flag = 1;
            text = argv[i + 1];
        }
        if (flag)
            deleteUtil(argv, i);

        i++;
    }

    return text;
}
bool check_for_redirection_input(char **argv)
{
    int i = 0;
    while (argv[i] != NULL)
    {

        if (strcmp(argv[i], "<") == 0)
        {
            return true;
        }
        i++;
    }
    return false;
}
void deleteUtil_input(char **argv, int pos)
{

    while (argv[pos] != NULL && strcmp(argv[pos], ">") != 0)
    {

        int j = pos;

        while (argv[j] != NULL)
        {
            argv[j] = argv[j + 1];
            j++;
        }
    }
}
char *getfile_input(char **argv)
{
    char *text;
    int x = -1;
    bool flag = 0;
    int i = 0;
    while (argv[i] != NULL)
    {

        if (strcmp(argv[i], "<") == 0)
        {
            x = i + 1;
            flag = 1;
            text = argv[i + 1];
        }
        if (flag)
            deleteUtil_input(argv, i);

        i++;
    }

    return text;
}

void input_redirection(char *directed_file)
{
    int newfd;
    newfd = open(directed_file, O_RDONLY);
    dup2(newfd, 0);

  
    return;
}

void Multiple_pipe(char **command){


   int size=0;
    int i=0;
    while(command[i]!=NULL )
    {
        if(strcmp(command[i], "|") == 0)
        {
            size++;
         
        }
        i++;
    }
    size++;
   
    char* (*cmd)[1024] = malloc(sizeof(char* [size][1024]));
     i=0;

    int x=0;
    int y=0;
    
    while(command[i]!=NULL )
    {   
        if(strcmp(command[i], "|") != 0)
        {
            cmd[x][y]=command[i];
        
             y++;
             
        }
        
        else 
        {
            
            x++;
            y=0;
        }
        i++;
        
    
    }

   int pipnum=size-1;
    int fd[pipnum][2];
    int pid[pipnum];
    for (int j = 0; j <= pipnum-1; j++)
    {
        pipe(fd[j]);
    }

 
 for ( i = 0; i <pipnum; i++)
{

    pid[i] = fork();
    if ( pid[i] == 0)
    {
       
        int n=0;
        while(n<=pipnum-1)
        {
          
            if(n!=i)
            {
            close(fd[n][0]);
          
                        }
            if(n!=(i+1))
            {
            close(fd[n][1]);
            
            }
         n++;
        }
       
      
                 

        dup2(fd[i][0], 0);
        dup2(fd[i+1][1], 1);
       
    
        execvp(cmd[i+1][0], cmd[i+1]);
        exit(1);



        close(fd[i][0]);
        close(fd[i+1][1]);
        return ;
    }

 }

       int n=0;
        while(n<=pipnum-1)
        {
      
            if(n!=pipnum-1)
            {
            close(fd[n][0]);
  
                        }
            if(n!=0)
            {
            close(fd[n][1]);
        
            }
            n++;
        }


           int f=fork();
           if(f==0){
int newfd3;
printf("");
printf(""); 
printf(""); 
printf(""); 
       

 char *directed_file_input;
        

   
   dup2(fd[0][1], 1);
    dup2(fd[pipnum-1][0], 0);

 if(check_for_redirection_input(cmd[0]))
        {
                    directed_file_input = getfile_input(cmd[0]);
                    input_redirection(directed_file_input);
        } 

    execvp(cmd[0][0], cmd[0]);
	exit(1);
           }
            else
        wait(NULL); 
 
}
bool pipe_check(char **command)
{

    int i = 0;
    while (command[i] != NULL)
    {
        if (strcmp(command[i], "|") == 0)
        {
            return true;
        }
        i++;
    }

    return false;
}
void Parsing_assignments(char **argv)
{
    int i = 0;
    char var[100] = {0};
    int j = 1;
    int s = 0;

    char str[100] = {0};
  
    while (argv[i] != NULL)
    {

        if (strcmp(argv[i], "=") == 0)
        {

           
            int f = i + 1;
            while (argv[f] != NULL)
            {
                strcat(str, argv[f]);
                strcat(str, " ");

                f++;
            }

            setenv(argv[i - 1], str, 1);
            break;
        }
        i++;
    }
 
}
void echo_parse(char **argv)
{

    char var[100] = {0};
    char temp[100] = {0};
    char *x;
    int i = 1;

    if (strcmp(argv[0], "echo") == 0)
    {

        if (argv[1][0] == '$')
        {
           

            while (argv[1][i] != 0)
            {

                var[i - 1] = argv[1][i];

                i++;
            }

            x = getenv(var);
           
            int j = 1;
            int s = 0;
            char d[100] = {0};

            
            if (x[0] == '`')
            {
                
                while (x[j] != '`')
                {
                    
                    *(d + s) = x[j];
                    

                    j++;
                    s++;
                }

                char *argv2[1024] = {0};
               

                build_args(d, argv2);
                int c = 1;
                argv[1] = "|";
                while (argv2[c - 1] != NULL)
                {
                    argv[c + 1] = argv2[c - 1];
                    
                    c++;
                }
             
            }
            else
            {
                argv[1] = 0;
                argv[1] = x;
            }
            if (pipe_check(argv))
            {
                printf("\n");
              
                Multiple_pipe(argv);
            }
        }
    }
}

bool equality(char *str)
{
    int i = 0;

    while (str[i] != 0)
    {
        if (str[i] == '=')
            return true;

        i++;
    }
    return false;
}

int parsing_equality(char* cmd,char **argv)
{
   
    
    char *token; 
    token = strtok(cmd, "=");
    int i = 0;
    while (token != NULL)
    {                             
        argv[i] = token;         
        token = strtok(NULL, "="); 
        i++;                      
    }
    argv[i] = NULL; 
    return i;    
}
void appending(char*str,char **argv)
{
    
    
        int i = 0;
        while (argv[i] != NULL)
        {

            strcat(str, argv[i]);
            strcat(str, " ");
     
            i++;

        }

   
}

int main()
{
    char line[BUFFER_LEN]; 
    char *argv[100];      
    char *bin = "/bin/";   
    char path[1024];       
    int argc;              
    chdir(getenv("HOME"));
    while (1)
    {
        int d=0;
        while(argv[d]!=NULL){
            argv[d]=0;
            d++;
        }
        printf("My shell>> "); 

        if (read_command(line) == 0)
        {
            printf("\n");
            break;
        }
        if (strcmp(line, "exit") == 0)
            break;                            
        argc = build_args(line, argv);      
        set_program_path(path, bin, argv[0]); 

        int newfd;
        char *directed_file_input;
        char *directed_file_output;

        int pid = fork(); 
        if (pid == 0)
        { 
            if (strcmp(argv[0], "cd") == 0)
            {
                change_dir(argv[0], argv[1]);
            }
            else if (argv[1] != NULL && strcmp(argv[1], "=") == 0)
            {
                Parsing_assignments(argv);
               
            }
            else if (equality(argv[0]))
            {
                char str[100] = {0};
                 appending(str,argv);
                argc = parsing_equality(str,argv);
                argv[2] = argv[1];
                argv[1] = "=";
                Parsing_assignments(argv);
            }

            else
            {
                if (check_for_redirection(argv))
                {
                    directed_file_output = getfile(argv);

                    if ((newfd = open(directed_file_output, O_CREAT | O_TRUNC | O_WRONLY, 0644)) < 0)
                    {
                        perror(directed_file_output); /* open failed */
                        exit(1);
                    }
                    printf("writing output of the command %s to \"%s\"\n", argv[0], directed_file_output);
                    dup2(newfd, 1);
                }

                if (pipe_check(argv))
                {
                    Multiple_pipe(argv);
                }

                else if (check_for_redirection_input(argv))
                {
                    directed_file_input = getfile_input(argv);
                    input_redirection(directed_file_input);
                }
                if (!pipe_check(argv) && strcmp(argv[0], "echo") == 0)
                {
                    
                    echo_parse(argv);
                }
                if (!pipe_check(argv))
                {
                    
                    execve(path, argv, 0);
                    perror(argv[0]);
                    fprintf(stderr, "Child process could not do execve\n");
                }

                exit(1);
   
                break;
            }
        }
        else
            wait(NULL); 
    }
    return 0;
}