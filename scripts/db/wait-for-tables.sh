# See the following website
# @see https://martinheinz.dev/blog/3
#
#       docker exec -it <container_name> psql -U<user_name> -a <db_name> -c '<command/query>'
#
test = (docker exec -it postgis psql -X -A -U green_user -a project -t -c 'SELECT count(*) FROM green_line.CAMERA')
echo $(test)

while ! docker exec -it ${DB_CONTAINER_NAME} psql -U ${DB_USER} -a ${POSTGRES_DB} -t -c ${DB_CONTAINER_INIT_TEST} >/dev/null 2>&1; do
    echo docker exec -it ${DB_CONTAINER_NAME} psql -U ${DB_USER} -a ${POSTGRES_DB} -c ${DB_CONTAINER_INIT_TEST} -gt 0 >&2
    echo "wait-for-tables.sh: Operation timed out: docker exec -it ${DB_CONTAINER_NAME} psql -U ${DB_USER} -a ${POSTGRES_DB} -c ${DB_CONTAINER_INIT_TEST}" >&2
    sleep 2
done