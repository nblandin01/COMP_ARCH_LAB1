			;####################################################################################
			;		Lab 01 - Nicole Blandin, Allen Duong, Yuhan (Tina) Wu
			;####################################################################################
			
data_to_sort	dcd		34, 23, 22, 8, 50, 74, 2, 1, 17, 40
			
list_elements	dcd		10
			
main
			ldr		r3, =data_to_sort   ; Load the starting address of the first
			;		of element of the array of numbers into r3
			ldr		r4, =list_elements  ; address of number of elements in the list
			ldr		r4, [r4]            ; number of elements in the list
			
			
			add		r5, r3, #400	     ; location of first element of linked list - "head pointer"
			
			;#################################################################################
			;		Include any setup code here prior to loop that loads data elements in array
			;#################################################################################
			mov		r6, r5			; location of last element of linked list - "tail pointer"
			
			mov		r7, #1			; Initialize loadLoop Counter
			
			ldr		r8, [r3]			; Add First Element of Array to Current Node
			bl		insert
			
			;#################################################################################
			;		Load elements in the array and add them to a linked list Node(PREV, DATA, NEXT)
			;#################################################################################
loadLoop
			lsl		r7, r7, #2		; Left Shift (x4) Index
			ldr		r8, [r3, r7]		; r9 = data_to_sort[r7]
			
			add		r6, r6, #32         ; Create new Node: mimic non-contiguous memory locations
			
			bl		insert			; Assume r8 is currVal, r6 is new Node
			
			add		r7, r7, #1		; Increment r7 to next element in array
			cmp		r7, r4			; Compare Current Element Index and Len of Array
			blt		loadLoop			; If still less than then loop
			
			bl		insertion_sort		; End of the Loop

			;#################################################################################
			;		INSERT FUNCTION - Assume r8 is currVal, r6 is address of new Node
			;#################################################################################	
insert 	
			sub		r2, r6, #28		; Get Memory Addr of Previous Element
			add		r9, r6, #36		; Get Memory Addr of Next Element
			
			str		r2, [r6]			; Store Address of Prev Element
			str		r8, [r6, #4]		; Store Data
			str		r9, [r6, #8]		; Store Address of Next Element
			
			mov		r15, r14			; Return (r14 is the Link Register; r15 is the Program Counter)
			
			;#################################################################################
			;		INSERTION SORT FUNCTION
			;#################################################################################
insertion_sort
			
for_loop
			
while_loop
				
			;#################################################################################
			;		SWAP FUNCTION
			;#################################################################################
			
			;#################################################################################
			;		DELETE FUNCTION
			;#################################################################################
			end
