#include <stdio.h>
#include <stdlib.h>
int i;
int j;
FILE *file;
long file_size;
char *buffer;

const char *filename = "a64.bin";
int main() {
	// Open the file in binary read mode
	file = fopen(filename, "rb");
	if (file == NULL) {
        perror("Error opening file");
        return 1;
  }
	// Get the file size
  fseek(file, 0, SEEK_END);
  file_size = ftell(file);
  rewind(file);

  // Allocate memory for the buffer
  buffer = (char*)malloc(file_size * sizeof(char));
	printf("file_size = %d\n",file_size);
  if (buffer == NULL) {
      perror("Memory allocation failed");
      fclose(file);
      return 1;
   }

   // Read data into the buffer
   size_t bytes_read = fread(buffer, sizeof(char), file_size, file);
   if (bytes_read != file_size) {
   		perror("Error reading file");
    	free(buffer);
      fclose(file);
      //return 1;
   }
	for(i=0;i<8;i++) {
		printf("0x%x %d ",*buffer,*buffer);
		buffer+=1;
	}

	printf("\n");

	for(i=0;i<8;i++)
		{
		for(j=0;j<8;j++)
		{
			printf("i = %d for j = %d\n",i,j);
		}
		}
	return 1;
}
