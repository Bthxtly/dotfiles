#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

/* 
 ** Lexer
 */

/* variables */
typedef struct Token {
    char *value;
    int len;
    char *type;
} Token;

char EOF_[] = "EOF", NUMBER[] = "NUMBER", LPAR[] = "LPAR", RPAR[] = "RPAR";
char ADD[] = "ADD", SUB[] = "SUB", MUL[] = "MUL", DIV[] = "DIV";

char input[200], *current_char = input;

/* functions */
char* get_input_stdin() {
    /* read all contents from stdin and restore them into input */
    char *p = input;
    while(scanf("%c", p++) != EOF) ;
    *p = '\0';
    return input;
}

void lexer_advence() {
    /* self increase the current_char, if reaches end of input then points to NULL */
    if(*++current_char == '\0')
        current_char = NULL;
}

void skip_whitespace() {
    /* skip space and \n between tokens */
    while(current_char != NULL && (*current_char == ' ' || *current_char == '\n'))
        lexer_advence();
}

Token* make_token(char* value, int len, char* type) {
    /* make a Token(value, type) */
    Token* newToken = (Token*) malloc(sizeof(Token));
    newToken->value = value;
    newToken->len = len;
    newToken->type = type;
    return newToken;
}

Token* get_a_number() {
    char *number = current_char;
    while(current_char != NULL && isdigit(*current_char))
        lexer_advence();
    return make_token(number, current_char - number, NUMBER);
}

Token* get_next_token() {
    while(current_char != NULL) {
        if (*current_char == ' ' || *current_char == '\n') {
            skip_whitespace();

        } else if (isdigit(*current_char)) {
            return get_a_number();

        } else if (*current_char == '+') {
            lexer_advence();
            return make_token(current_char - 1, 1, ADD);

        } else if (*current_char == '-') {
            lexer_advence();
            return make_token(current_char - 1, 1, SUB);

        } else if (*current_char == '*') {
            lexer_advence();
            return make_token(current_char - 1, 1, MUL);

        } else if (*current_char == '/') {
            lexer_advence();
            return make_token(current_char - 1, 1, DIV);

        } else if (*current_char == '(') {
            lexer_advence();
            return make_token(current_char - 1, 1, LPAR);

        } else if (*current_char == ')') {
            lexer_advence();
            return make_token(current_char - 1, 1, RPAR);

        }
    }

    return make_token(EOF_, 1, EOF_);
}

void print_token(Token* t) {
    /* print a token in the format of Token("value", type) */
    printf("token(\"%.*s\", %s)\n", t->len, t->value, t->type);
}

/*
 **Parser
 */

Token *current_token;

void error(char* msg) {
    /* raise error with message and exit the program */
    printf("%s\n", msg);
    exit(EXIT_FAILURE);
}

void parser_advence() {
    /* update the current token the release the former token */
    if(current_token->type == EOF_)
        ;
    free(current_token);
    current_token = get_next_token();
}

void eat(char* type) {
    /* if the current token is the expected the type, then advence, else raise error */
    if (current_token->type != type) error("error");
    parser_advence();
}

int str2int(char* begin, int len) {
    /* convert string "123" to number 123 */
    int result = 0;
    while(len--)
        result = result * 10 + *(begin++) - '0';
    return result;
}

int factor() {
    /*
     * factor: NUMBER | LPAR expr RPAR
     */
    int expr();
    int result;
    if (current_token->type == NUMBER) {
        result = str2int(current_token->value, current_token->len);
        eat(NUMBER);
    } else if (current_token->type == LPAR) {
        eat(LPAR);
        result = expr();
        eat(RPAR);
    } else
        error("factor error!");
    return result;
}

int term() {
    /*
     * term: factor ( ( MUL | DIV ) factor )*
     */
    int result = factor();
    while(current_token->type == MUL || current_token->type == DIV) {
        if (current_token->type == MUL) {
            eat(MUL);
            result = result * factor();

        } else if (current_token->type == DIV) {
            eat(DIV);
            result = result / factor();

        }
    }
    return result;
}

int expr() {
    /*
     * expr: term ( ( ADD | SUB ) term )*
     */
    int result = term();
    while(current_token->type == ADD || current_token->type == SUB) {
        if (current_token->type == ADD) {
            eat(ADD);
            result = result + term();

        } else if (current_token->type == SUB) {
            eat(SUB);
            result = result - term();

        }
    }
    return result;
}

int parse() {
    /*
     * expr
     */
    return expr();
}

/* 
 ** Main
 */
int main(int argc, char *argv[]) {
    get_input_stdin();
    current_token = get_next_token();
    int answer = parse();
    printf("%d\n", answer);
    return 0;
}

// vim:foldmethod=indent
