process print_timestamp {

   publishDir "output/${params.timestamp}", mode: 'copy'

   output:
   path('*.txt')

   shell:
   '''
   echo "Hello world, the timestap is: !{params.timestamp}" > timestamp.txt
   '''
}

workflow {
  print_timestamp | view
}
