#include <stdio.h>
#include <stdlib.h>
int i;
int j;
FILE *file;
long file_size;
char *buffer;
signed short a[7][7];
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
	for(j=0;j<8;j++) {
		for(i=0;i<8;i++) {
			a[j][i]=*buffer;
			//printf("0x%x ",a[j][i]);
			printf("%d ",a[j][i]);
			buffer+=1;
		}
		printf("\n");
		buffer+=56;
	}
	for(j=0;j<8;j++) {
		for(i=0;i<8;i++) {
			if (i==0) {
				a[j][i] =   a[j][i] -  (a[j][i] + a[j][i+1] + 2 )>>2;
				 
			}
			a[j][i] =   a[j][i] -  (a[j][i-1] + a[j][i+1] + 2 )>>2;
			 
			if (i==7) {
				a[j][i] =   a[j][i] -  (a[j][i+1] + a[j][i+1] + 2 )>>2;
				 
			}

 
		}
	} 

printf("\n");

	for(j=0;j<8;j++)
		{
		for(i=0;i<8;i++)
		{
			//printf("0x%x ",a[j][i]);
			printf("%d ",a[j][i]);
		}
		printf("\n");
		}



	return 1;
}
