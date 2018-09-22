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
load_loop
			lsl		r7, r7, #2		; Left Shift (x4) Index
			ldr		r8, [r3, r7]		; r9 = data_to_sort[r7]
			
			add		r6, r6, #32         ; Create new Node: mimic non-contiguous memory locations
			
			bl		insert			; Assume r8 is currVal, r6 is new Node
			
			add		r7, r7, #1		; Increment r7 to next element in array
			cmp		r7, r4			; Compare Current Element Index and Len of Array
			blt		load_loop			; If still less than then loop
			
			;#################################################################################
			;		SETUP CODE FOR INSERTION SORT
			;#################################################################################
			mov		r0, #1			; Initialize Increment Variable
			
			;#################################################################################
			;		INSERTION SORT FUNCTION
			;#################################################################################
insertion_sort
			
			
			
for_loop
			
while_loop
			
			
			;#################################################################################
			;		HELPER FUNCTIONS
			;#################################################################################
			
insert 		; Assume r8 is new Data and r6 is tail pointer to new Node
			sub		r2, r6, #28		; Get Memory Addr of Previous Element
			add		r9, r6, #36		; Get Memory Addr of Next Element
			
			str		r2, [r6, #0]		; Store Address of Prev Element
			str		r8, [r6, #4]		; Store Data
			str		r9, [r6, #8]		; Store Address of Next Element
			
			mov		r15, r14			; Return (r14 is the Link Register; r15 is the Program Counter)
			
			
swap			; Swap Relative to Pointer Passed in with r0 - r0 is Current Node
			ldr		r1, [r0, #0]		; Load PREV Pointer of Current Node
			ldr		r2, [r0, #8]		; Load NEXT Pointer of Current Node
			str		r1, [r2, #0]		; Store PREV Pointer in PREV Position of Next Node
			str		r2, [r1, #8]		; Store NEXT Pointer in NEXT Position of Previous Node
			str		r1, [r0, #8]		; Store NEXT Pointer in NEXT Position of Current Node
			ldr		r2, [r1, #0]		; Load PREV Pointer of Previous Node
			str		r2, [r0, #0]		; Store PREV Pointer of Previous Node as PREV of Current Node
			str		r0, [r2, #8]		; Store Current Node as NEXT Pointer of Previous Node
			str		r0, [r1, #0]		; Store Current Node as PREV of Previous Node
			
			mov		r15, r14
			
			
delete		ldr		r1, [r0, #0]		; Load PREV Pointer
			ldr		r2, [r0, #8]		; Load NEXT Pointer
			str		r1, [r2, #0]		; Store PREV Pointer as PREV of Next Node
			str		r2, [r1, #8]		; Store NEXT as NEXT of Previous Node
			
			mov		r15, r14
			
			end
